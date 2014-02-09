ActiveAdmin.register Property do
    form multipart: true do |f|
      f.semantic_errors :property
      f.inputs "Details" do
        f.input :title
        f.input :price
      end
      f.inputs "Content" do
        f.input :description
        f.input :address
        f.input :photo, :label => "Primary Picture"
      end
      f.inputs "Picture Attachments" do
        f.has_many :attachments, :heading => nil, :allow_destroy => true, :new_record => true do |pf|
          pf.input :picture
        end
      end
      f.actions
    end

  #index :as => :grid do |property|
   # link_to(image_tag(property.photo.url(:thumb), :alt =>  property.title), admin_property_path(property))
    #link_to('Post to Loopnet',loopnet_property_path(property), options = {method: :post})
  #end

    index do
    column "Address" do |property|
      property.address
    end
    column "Photo" do |property|
      link_to(image_tag(property.photo.url(:thumb), :alt =>  property.title), property_path(property))
    end
    actions do |property|
      link_to('Post to Loopnet',loopnet_property_path(property), options = {method: :post})
    end
  end
  
    
  # See permitted parameters documentation:
  # https://github.com/gregbell/active_admin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # permit_params :list, :of, :attributes, :on, :model
  #
  # or
  #
 controller do
  def new
    @property = Property.new
    #6.times { @property.attachments.build } 

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

  def permitted_params
   params.permit(:property => [:title, :price, :address, :description, :photo, attachments_attributes: [:picture]])
  end

  def property_params
  params.require(:property).permit(:photo, :title, :description, :price, :address,  attachments_attributes: [:picture])
  end
 end


  
end
