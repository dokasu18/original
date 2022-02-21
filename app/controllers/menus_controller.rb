class MenusController < ApplicationController
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

  private

  def menu_params
    params.require(:menu).permit(:title, :advice_text, :hour_id, :food_first, :food_second, :spice, :image,
                                  steps_attributes:[:step_text, :step_number, :_destroy, :id]).merge(user_id: current_user.id)
  end
end
