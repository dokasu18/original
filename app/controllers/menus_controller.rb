class MenusController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  before_action :move_to_index, only: [:edit, :destroy]

  def index
    @menus = Menu.includes(:user)
  end

  def new
    @menu = Menu.new
    @step = @menu.steps.build
  end

  def create
    @menu = Menu.new(menu_params)
    if @menu.save
      redirect_to root_path(@menu)
   else
      render :new
   end   
  end

  def show
    @menu = Menu.find(params[:id])
    @steps = @menu.steps.includes(:menu)
    @comment = Comment.new
    @comments = @menu.comments.includes(:user)
  end

  def edit
    @menu = Menu.find(params[:id])
    unless current_user.id == @menu.user_id
      redirect_to action: :index
    end
  end

  def update
    @menu = Menu.find(params[:id])
    if @menu.update(menu_params) 
      redirect_to menu_path
    else
      render :edit
    end
  end

  def destroy
    @menu.destroy
    redirect_to root_path
  end

  private

  def menu_params
    params.require(:menu).permit(:title, :advice_text, :hour_id, :food_first, :food_second, :spice, :image,
                                  steps_attributes:[:step_text, :step_number, :_destroy, :id]).merge(user_id: current_user.id)
  end


  def set_item
    @menu = Menu.find(params[:id])
  end

  def move_to_index
    unless current_user.id == @menu.user_id
      redirect_to action: :index
    end
  end

end
