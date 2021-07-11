class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit]
  before_action :set_item, only: [:show, :edit, :update]
  before_action :move_to_index, only: :edit


  def index
    @items = Item.includes(:user).order("created_at DESC")
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if  @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    
  end

  def edit
    
  end

  def update
    if  @item.update(item_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  private
  def move_to_index
    unless current_user.id == @item.user.id
      redirect_to action: :index
    end
  end
  def set_item
    @item = Item.find(params[:id])
  end
  def item_params
    params.require(:item).permit(:name, :text, :selling_price, :category_id, :status_id, :shipping_cost_id, :prefecture_id, :shipping_time_id, :image).merge(user_id: current_user.id)
  end
end
