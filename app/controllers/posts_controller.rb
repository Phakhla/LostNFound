# frozen_string_literal: true

class PostsController < ApplicationController
  before_action :load_post, only: %i[show edit update destroy]
  before_action :load_comments, only: %i[show]
  before_action :load_user, only: %i[show]
  before_action :mark_all_comments_as_read, only: %i[show]

  def index
    @posts = Post.all
  end

  def show; end

  def new; end

  def edit; end

  def create
    @post = current_user.posts.build(post_params)

    if @post.save
      redirect_to root_url
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update; end

  def destroy; end

  def search
    @q = Post.ransack(params[:q])
    @posts = @q.result

    @posts = @posts.page(params[:page]).per(4)
  end

  def lost
    @posts = Post.lost_item.page(params[:page]).per(6)
  end

  def found
    @posts = Post.found_item.page(params[:page]).per(6)
  end

  private

  def load_post
    @post = Post.find(params[:id])
  end

  def load_comments
    @comments = @post.comments.order(created_at: :desc)
  end

  def load_user
    @user = @post.user
  end

  def mark_all_comments_as_read
    return if @user != current_user

    notification_ids = @comments.map { |c| c.notifications_as_comment.ids }.flatten
    Notification.where(id: notification_ids).mark_as_read!
  end

  def post_params
    params.require(:post).permit(
      :name, :category, :types, :status, :date, :time,
      :location, :detail, :reward, images: []
    )
  end
end
