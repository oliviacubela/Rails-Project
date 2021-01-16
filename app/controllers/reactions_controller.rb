class ReactionsController < ApplicationController
  
  def new
    @dream = Dream.find_by_id(params[:dream_id])
    @reaction = @dream.reactions.build
  end

  def create 
    # binding.pry
    @reaction = current_user.reactions.build(reaction_params)
    if @reaction.save
      redirect_to reaction_path(@reaction)
    else
      render :new
      # flash[:error] = "sorry, didnt save"
    end
  end

  def show 
    @reaction = Reaction.find_by_id(params[:id])
  end

  def index 
  end

  private 

  def reaction_params 
    params.require(:reaction).permit(:dream_id, :name, :description)
  end
end
