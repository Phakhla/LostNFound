# frozen_string_literal: true

class HomeController < ApplicationController
  def index
    @losts = Post.lost_item
    @founds = Post.found_item
  end
end
