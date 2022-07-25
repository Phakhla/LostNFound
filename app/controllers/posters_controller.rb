# frozen_string_literal: true

class PostersController < ApplicationController
  before_action :load_post

  def new; end

  def show
    @p = params[:post]

    respond_to do |format|
      format.html
      format.pdf do
        render pdf: 'poster',
               page_size: 'A4',
               encoding: 'UTF-8',
               margin: { top: 0, bottom: 0, left: 0, right: 0 },
               template: 'posters/show',
               layout: 'pdf',
               disposition: 'attachment'
      end
    end
  end

  private

  def load_post
    @post = Post.find(params[:post_id])
  end
end
