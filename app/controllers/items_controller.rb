class ItemsController < ApplicationController

  before_filter :authenticate_user!
  before_filter :owns_item
  def index
    items = Item.all

    render json: items, status: 200
  end

  def create
    item = Item.new(item_params)
    item.user = current_user
    if item.save
      render json: item, status: 201, location: item
    else
      render json: item.errors, status: 422
    end
  end

  def destroy
    item = Item.find(params[:id])
    item.destroy!
    render nothing:true, status: 204
  end

  def item_params
    params.permit(:name, :checked)
  end

  def owns_item
    if !user_signed_in? || current_user != Item.find(params[:id]).user

end
