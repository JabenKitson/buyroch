  class HomeController < ApplicationController

    def index
      @searchtype = "properties"
      @properties = Property.where("(unique_space != true or unique_space IS NULL) and visible_on_buyroch = true").order("created_at DESC").limit(5)
      @hash = gmaphash(@properties)
    end

    def about
    	
    end

  end