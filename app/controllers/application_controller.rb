class ApplicationController < ActionController::Base
  protect_from_forgery

  private

  def client    
    Douban.client(:access_token => session[:access_token],
                  :refresh_token => session[:refresh_token], 
                  :user_id => session[:user_id])    
  end

end
