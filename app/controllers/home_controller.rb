# frozen_string_literal: true

class HomeController < ApplicationController
  before_action :set_filter, only: [:index]
  before_action :set_tab, only: [:index]

  def index
    @search = params[:q][:name_cont] if params[:q]
    @q = @tab == 'all_posts' ? Post.ransack(params[:q]) : current_user.posts.ransack(params[:q])
    @posts = @q.result

    @losts = load_posts_with_filter(:lost_item)
    @founds = load_posts_with_filter(:found_item)
  end

  private

  def set_tab
    @tab = params[:tab] || 'all_posts'
  end

  def set_filter
    @filter = params[:filter] || {}
  end

  def load_posts_with_filter(category)
    if @filter.dig(category, :status)
      @posts.where(status: @filter[category][:status], category:)
    else
      @posts.where(category:).latest.page(params[:page]).per(10)
    end
  end
end
