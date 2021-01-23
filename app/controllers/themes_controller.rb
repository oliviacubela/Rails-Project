class ThemesController < ApplicationController
  before_action :redirect_if_not_logged_in
  
  def index
    @themes = Theme.all 
  end

  def show 
    @theme = Theme.find_by_id(params[:id])
  end
end
