# Application Controller
# Author: Dae

class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

    def current_visitor
    @current_visitor ||= if cookies[:visitor_id]
      Visitor.find(cookies[:visitor_id])
      else
        visitor = Visitor.create(ip_address: request.remote_ip, mobile: mobile_device?)
        cookies[:visitor_id] = visitor.id
        visitor
      end
    end
    helper_method :current_visitor


    def mobile_device?
      request.user_agent.downcase.include?("mobile")
    end
    helper_method :mobile_device?
    
end
