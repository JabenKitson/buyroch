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
        f.input :photo
      end
      f.actions
    end
  
  # See permitted parameters documentation:
  # https://github.com/gregbell/active_admin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # permit_params :list, :of, :attributes, :on, :model
  #
  # or
  #
 controller do
  def permitted_params
   params.permit(:property => [:title, :price, :address, :description, :photo])
  end
 end


  
end
