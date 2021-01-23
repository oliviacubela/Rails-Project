class DreamsController < ApplicationController
  before_action :set_dream, only:[:show, :edit, :update]
  # before_action :redirect_if_not_logged_in

  def new
    @dream = Dream.new
    @dream.build_theme
  end

  def create
    @dream = Dream.new(dream_params)
    @dream.user_id = session[:user_id]
    if @dream.save #validation occurs here
      redirect_to dream_path(@dream)
    else
      @dream.build_theme
      render :new
    end
  end

  def index
    @dreams = Dream.all 
  end

  def show 
  end

  def edit 
  end

  def update 
    if @dream.update(dream_params)
      redirect_to dream_path(@dream)
    else
      render :edit 
    end
  end

  private 

  def dream_params 
    params.require(:dream).permit(:title, :content, :theme_id, theme_attributes: [:name, :description])
  end

  def set_dream
    @dream = Dream.find_by_id(params[:id])
    redirect_to dreams_path if !@dream
  end
end
