# frozen_string_literal: true

class HomeController < ApplicationController
  def index
    @search = params[:q][:name_cont] if params[:q]
    @q = Post.ransack(params[:q])
    @posts = @q.result

    @losts = @posts.lost_item.order(created_at: :desc).page(params[:page]).per(10)
    @founds = @posts.found_item.order(created_at: :desc).page(params[:page]).per(10)
  end
end
