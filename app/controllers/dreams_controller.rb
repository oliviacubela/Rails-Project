class DreamsController < ApplicationController
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
    @dream = Dream.find_by_id(params[:id])
    redirect_to dreams_path if !@dream
  end

  private 

  def dream_params 
    params.require(:dream).permit(:title, :content, :theme_id, theme_attributes: [:name, :description])
  end
end
