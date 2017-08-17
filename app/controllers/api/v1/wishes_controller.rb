class Api::V1::WishesController < ApplicationController

  def index
    user = User.find_by(id: params[:user_id])
    unless user
      render json: { error: "user not found" }, status: 404
      return
    end
    wishes = user.wishes.where(user_id: params[:user_id])
    render json: wishes
  end

  def show
    user = User.find_by(id: params[:user_id])
    unless user
      render json: { error: "user not found" }, status: 404
      return
    end
    wish = user.wishes.find_by(id: params[:id])
    unless wish
      render json: { error: "wish not found" }, status: 404
      return
    end
    render json: wish
  end

  def update
    user = User.find_by(id: params[:user_id])
    unless user
      render json: { error: "user not found" }, status: 404
      return
    end
    wish = user.wishes.find_by(id: params[:id])
    unless wish
      render json: { error: "wish not found" }, status: 404
      return
    end
    wish.update(wish_params)
    render json: wish
  end

  def destroy
    user = User.find_by(id: params[:user_id])
    unless user
      render json: { error: "user not found" }, status: 404
      return
    end
    wish = user.wishes.find_by(id: params[:id])
    unless wish
      render json: { error: "wish not found" }, status: 404
      return
    end
    wish.destroy
    render json: wish
  end


end
