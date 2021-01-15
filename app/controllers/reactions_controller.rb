class ReactionsController < ApplicationController
  
  def new
    @dream = Dream.find_by_id(params[:dream_id])
    @reaction = @dream.reactions.build
  end

  def index 

  end

end
