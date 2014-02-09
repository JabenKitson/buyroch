class API::V1::PropertiesController < ApplicationController

  def index
  	if params[:query]
    ss = "%#{params[:query]}%"
  	  @properties = Property.where("address LIKE ? or title LIKE ? or description LIKE ?",ss,ss,ss)
    else
      @properties = Property.all
    end
    
    respond_to do |format|
      format.json { render :json => @properties}
    end
  end

end