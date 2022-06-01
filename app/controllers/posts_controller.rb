class PostsController < ApplicationController
  before_action :set_post, only: %i[show edit update destroy]

  def index; end

  def show; end

  def new; end

  def edit; end

  def create; end

  def update; end

  def destroy; end

  private

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:name, :lost_date)
  end
end
