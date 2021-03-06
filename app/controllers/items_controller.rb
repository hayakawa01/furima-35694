class ItemsController < ApplicationController
  before_action :authenticate_user!,except:[:index,:show] 
  before_action :choose_item,only:[:show,:edit,:update,:destroy]
  before_action :correct_edit,only:[:edit,:update,:destroy]

  def index
    @items = Item.includes(:user).order("id DESC")
  end
  
  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
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
    if @item.update(item_params)
      redirect_to action: :show
    else
      render  :edit     
    end
  end

  def destroy
    @item.destroy
    redirect_to root_path
  end

  private
  def item_params
    params.require(:item).permit(:image,:name,:detail,:category_id,:condition_id,:delivery_charge_id,:prefecture_id,:delivery_time_id,:price).merge(user_id:current_user.id)
  end

  def choose_item
    @item = Item.find(params[:id])
  end

  def correct_edit
    if current_user.id != @item.user_id || @item.order.present?
      redirect_to root_path
    end
  end

end
