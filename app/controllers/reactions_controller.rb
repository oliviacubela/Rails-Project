class ReactionsController < ApplicationController
  
  def new
    @dream = Dream.find_by_id(params[:dream_id])
    @reaction = @dream.reactions.build
  end

  # def new 
  #   if @dream = Dream.find_by_id(params[:dream_id])
  #     @reaction = @dream.reactions.build
  #   else
  #     @reaction = Reaction.new 
  #   end
  # end

  # => adds more flexibility 

  def create 
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
    #only difference between a nested & un-nested route is if it has dream_id.. 
    if @dream = Dream.find_by_id(params[:dream_id]) #checks to make sure there's a valid dream id
      @reactions = @dream.reactions
    else 
      @reactions = Reaction.all #if no reaction, goes to index 
    end
  end

  private 

  def reaction_params 
    params.require(:reaction).permit(:dream_id, :name, :description)
  end
end
