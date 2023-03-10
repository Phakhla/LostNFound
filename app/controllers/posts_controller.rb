# frozen_string_literal: true

class PostsController < ApplicationController
  before_action :set_tab, only: %i[lost found]
  before_action :set_filter, only: %i[lost found]
  before_action :load_posts, only: %i[lost found]
  before_action :load_post, only: %i[show edit update destroy]
  before_action :load_comments, only: %i[show]
  before_action :load_user, only: %i[show]
  before_action :mark_all_comments_as_read, only: %i[show]
  before_action :authorize_owner, only: %i[edit update]

  def show
    @https = 'https://www.'
    @fblink = 'facebook.com'
  end

  def new
    @post = Post.new(category: params[:category])
  end

  def edit; end

  def category_selects; end

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      redirect_to root_url
    else
      render :new, status: :unprocessable_entity, layout: 'nav_white'
    end
  end

  def update
    if @post.update(post_params)
      redirect_to post_path(@post.id)
    else
      render :edit, status: :unprocessable_entity, layout: 'nav_white'
    end
  end

  def destroy
    @post.destroy!
    redirect_to root_url, status: :see_other
  end

  def search
    @location = params[:location]
    @q = Post.ransack(params[:q])
    @posts = @q.result
    @posts = sort_by_coordinates

    @posts = @posts.page(params[:page]).per(8)
  end

  def autocomplete
    @search_results = Post.all.distinct.where('name ILIKE ?', "%#{params[:q]}%").pluck(:name)
    render layout: false
  end

  def lost
    @posts = load_posts_with_filter(:lost_item)
  end

  def found
    @posts = load_posts_with_filter(:found_item)
  end

  private

  def load_post
    if Post.find_by(id: params[:id]).present?
      @post = Post.find_by(id: params[:id])
    else
      render 'errors/not_found', status: :not_found
    end
  end

  def load_posts
    @search = params[:q][:name_cont] if params[:q]
    @q = @tab == 'all_posts' ? Post.ransack(params[:q]) : current_user.posts.ransack(params[:q])
    @posts = @q.result
  end

  def load_comments
    @comments = @post.comments.order(created_at: :asc)
  end

  def load_user
    @user = @post.user
  end

  def mark_all_comments_as_read
    return if @user != current_user

    notification_ids = @comments.map { |c| c.notifications_as_comment.ids }.flatten
    Notification.where(id: notification_ids).mark_as_read!
  end

  def set_tab
    @tab = params[:tab] || 'all_posts'
  end

  def set_filter
    @filter = params[:filter] || {}
  end

  def load_posts_with_filter(category)
    status = @filter.dig(category, :status)
    posts = status.present? ? @posts.send(status.to_sym) : @posts
    posts.where(category:).latest.page(params[:page]).per(12)
  end

  def sort_by_coordinates
    @lat = params[:lat]
    @lng = params[:lng]

    @posts.order_nearest(@lat, @lng)
  end

  def authorize_owner
    redirect_to post_path unless @post.owner?(current_user)
  end

  def post_params
    params.require(:post).permit(
      :name, :category, :status, :date, :time,
      :location, :detail, :reward, :lat, :lng,
      :type_id, :reason, images: [], remove_images: []
    )
  end
end
