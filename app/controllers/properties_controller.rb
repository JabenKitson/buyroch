class PropertiesController < ApplicationController

  def loopnet
      @property = Property.find(params[:id])
      @id = params[:id]
      @status = @property.loopnet(current_user.loopnet_logon,current_user.loopnet_password)
      #redirect_to {:action => :show}

  end

  def show
  	@property = Property.find(params[:id])
    
    @hash = Gmaps4rails.build_markers(@property) do |place, marker|
         marker.lat place.latitude
         marker.lng place.longitude
     end
     
  end

  def new
     @property = Property.new
  end

  def create
 
      @property = Property.new(property_params)
      @property.user_id = current_user.id
      Rails.logger.info("###DEBUG current_user     :=> #{current_user}")
      Rails.logger.info("###DEBUG property.user_id :=> #{@property.user_id}")
        respond_to do |format|
      if @property.save
        format.html { redirect_to @property, notice: 'Property was successfully created.' }
        format.json { render action: 'show', status: :created, location: @post }
      else
        Rails.logger.info(@property.errors.inspect)
        format.html { render action: 'new' }
        format.json { render json: @property.errors, status: :unprocessable_entity }
      end
    end   
     
 end


  def update
    property = Property.find(params[:id])
    property.update_attributes!(property_params)
    redirect_to property
  end

  def myproperties
    @properties = Property.all()
  end

private

# Use strong_parameters for attribute whitelisting
# Be sure to update your create() and update() controller methods.

def property_params
  params.require(:property).permit(:photo, :title, :description, :price, :address)
end

end
