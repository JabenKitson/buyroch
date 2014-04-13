class API::V1::PropertiesController < ApplicationController
before_filter :cors_preflight_check
after_filter :cors_set_access_control_headers

# For all responses in this controller, return the CORS access control headers.

def cors_set_access_control_headers
  headers['Access-Control-Allow-Origin'] = '*'
  headers['Access-Control-Allow-Methods'] = 'POST, GET, OPTIONS'
  headers['Access-Control-Max-Age'] = "1728000"
end

# If this is a preflight OPTIONS request, then short-circuit the
# request, return only the necessary headers and return an empty
# text/plain.

def cors_preflight_check
  if request.method == :options
    headers['Access-Control-Allow-Origin'] = '*'
    headers['Access-Control-Allow-Methods'] = 'POST, GET, OPTIONS'
    headers['Access-Control-Allow-Headers'] = 'X-Requested-With, X-Prototype-Version'
    headers['Access-Control-Max-Age'] = '1728000'
    render :text => '', :content_type => 'text/plain'
  end
end


  def index
  	if params[:query]
    ss = "%#{params[:query]}%"
  	  @properties = Property.where("published = true and (unique_space != true or unique_space IS NULL)  and (address LIKE ? or title LIKE ? or description LIKE ?)",ss,ss,ss)
    elsif params[:agent]
      agent = params[:agent]
      @properties = Property.joins(:user).where("(properties.unique_space != true or properties.unique_space IS NULL) and properties.published = true and users.email = ?",agent)
    else
      @properties = Property.where("(properties.unique_space != true or properties.unique_space IS NULL) and published = true")
    end
    
    respond_to do |format|
      format.json { render :json => @properties}
    end
  end

end