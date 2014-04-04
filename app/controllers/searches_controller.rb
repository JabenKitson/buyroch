class SearchesController < ApplicationController
  def properties
  	@searchtype = "properties"
  	  #@properties = Property.search params[:query]
  	  ss = "%#{params[:query]}%"
  	 if (params[:query]) then 
  	  @properties = Property.where("(unique_space != true or unique_space IS NULL)  and visible_on_buyroch = true and (address LIKE ? or title LIKE ? or description LIKE ?)",ss,ss,ss)
     else
     	@properties = Property.where("(unique_space != true or unique_space IS NULL) and visible_on_buyroch = true").order("created_at DESC").limit(5)
     end
      @hash = gmaphash(@properties)
  end


    def unique_spaces
    	@searchtype = "unique_spaces"
  	  #@properties = Property.search params[:query]
  	  ss = "%#{params[:query]}%"
  	  if (params[:query]) then 
  	  	@properties = Property.where("unique_space = true and visible_on_buyroch = true and (address LIKE ? or title LIKE ? or description LIKE ?)",ss,ss,ss)
  	  else 
  	  	@properties = Property.where("unique_space = true and visible_on_buyroch = true").order("created_at DESC").limit(5)
  	  end

      @hash = gmaphash(@properties)
  end
end
