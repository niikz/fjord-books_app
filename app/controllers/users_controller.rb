# frozen_string_literal: true

class UsersController < ApplicationController
  def index
    @users = User.with_attached_avatar.order(:id).page(params[:page])
  end

  def show
    @user = User.find(params[:id])
    @followed = current_user.active_friendships.find_by(followed_id: @user.id)
  end

  def followings
    @title = 'フォロー中'
    @user  = User.find(params[:id])
    @users = @user.followings.order(:id).page(params[:page])
    render 'show_follow'
  end

  def followers
    @title = 'フォロワー'
    @user  = User.find(params[:id])
    @users = @user.followers.order(:id).page(params[:page])
    render 'show_follow'
  end
end
