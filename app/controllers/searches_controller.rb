class SearchesController < ApplicationController
  def show
  	  #@properties = Property.search params[:query]
  	  ss = "%#{params[:query]}%"
  	  @properties = Property.where("address LIKE ? or title LIKE ? or description LIKE ?",ss,ss,ss)
      @hash = gmaphash(@properties)
  end
end
