# frozen_string_literal: true

class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
    @posts = Post.order(created_at: :desc)
    @events = Event.order(date: :desc)
  end

  def about; end
end
