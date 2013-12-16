class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_url, :alert => exception.message
  end

  def gmaphash(geocoded_model)
  	hash = Gmaps4rails.build_markers(geocoded_model) do |place, marker|
         marker.lat place.latitude
         marker.lng place.longitude
         marker.infowindow '<a href="/properties/' + place.id.to_s + '"> <img src="' + place.photo.url(:thumb) + '"></a><h6>' + place.title + '</h6>'
         marker.json({title: place.title})
     end
   end

end
