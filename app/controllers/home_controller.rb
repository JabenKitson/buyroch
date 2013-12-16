  class HomeController < ApplicationController

    def index
      @properties = Property.order("created_at DESC").limit(5)
      @hash = gmaphash(@properties)
    end

    def about
    	
    end

    def commercial
     @properties = Property.order("created_at DESC").limit(5) 	
    end

  end