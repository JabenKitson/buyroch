ActiveAdmin.register Property do
    
    #form :partial => "form" #javascript in app/views/admin/posts/_form.html.erb

     form multipart: true do |f|
      f.semantic_errors :property
      f.inputs "Details" do
        f.input :title
        f.input :forsale, :label => "For Sale?"
        f.input :lease, :label => "For Lease?"
        f.input :unique_space, :label => "Unique Space?"
        f.input :published, :label => "Enable? (allows display on your site)"
        f.input :visible_on_buyroch, :label => "Display on BuyRoch?"
        f.input :price, :label => "Asking Price"
        f.input :price_unit, :label => "Price Unit (day, week, month)"
        f.input :sqrft, :label => "Square Footage"
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

  def edit
    @property = Property.find(params[:id])
    # property_params.delete(:attachments_attributes) 
    # params[:photo_file_name] = @property.photo_file_name
    # 6.times { @property.attachments.build } 

  end



  def create
     @property = Property.new(property_params)
      @property.user_id = current_user.id
      Rails.logger.info("###DEBUG current_user     :=> #{current_user}")
      Rails.logger.info("###DEBUG property.user_id :=> #{@property.user_id}")
        respond_to do |format|
         if @property.save
           format.html { redirect_to '/admin/properties', notice: 'Property was successfully created.' }
           format.json { render action: 'show', status: :created, location: @post }
         else
           Rails.logger.info(@property.errors.inspect)
           format.html { render action: 'new' }
           format.json { render json: @property.errors, status: :unprocessable_entity }
         end
        end
  end

  def permitted_params
   params.permit(:property => [:id, :published, :visible_on_buyroch, :lease, :price_unit, :sqrft, :unique_space ,:title, :price, :address, :description, :photo, attachments_attributes: [:id, :picture, :_destroy]])
  end

  def property_params
  params.require(:property).permit(:id, :published, :visible_on_buyroch, :lease, :price_unit, :sqrft, :unique_space,:photo, :title, :description, :price, :address, attachments_attributes: [:id, :picture, :_destroy])
  end
 end


  
end
