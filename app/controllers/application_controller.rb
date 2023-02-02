class ApplicationController < ActionController::Base
  
  private
  
  def after_sign_in_path_for(resource) 
    trips_path
  end
end
