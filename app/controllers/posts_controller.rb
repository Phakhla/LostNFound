# frozen_string_literal: true

class PostsController < ApplicationController
  before_action :set_post, only: %i[show edit update destroy]

  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
    @user = @post.user
    @comments = @post.comments.order(created_at: :desc)
  end

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
    @posts = Post.page(params[:page]).per(4)
  end

  def lost
    @posts = Post.lost_item.page(params[:page]).per(6)
  end

  def found
    @posts = Post.found_item.page(params[:page]).per(6)
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(
      :name, :category, :types, :status, :date, :time,
      :location, :detail, :reward, images: []
    )
  end
end
