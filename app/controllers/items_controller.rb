class ItemsController < ApplicationController

  def index
    items = Item.all

    render json: items, status: 200
  end

  def create
    item = Item.new(item_params)
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

end
