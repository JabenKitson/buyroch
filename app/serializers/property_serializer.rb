class PropertySerializer < ActiveModel::Serializer
  attributes :title, :address, :description, :property_url, :image_url, :agent_url, :agent_image_url, :agent_name, :agent_email 
  
  def property_url
  	url_for :controller => '/properties', :action => 'show', :id => object.id
  end

  def image_url
  	root_url + object.photo.url(:medium)
  end

  def agent_url
    url_for :controller => '/users', :action => 'show', :id => object.user.id
  end

  def agent_image_url
  	root_url + object.user.avatar.url(:thumb)
  end

  def agent_name
  	object.user.name
  end

  def agent_email 
  	object.user.email
  end

end
