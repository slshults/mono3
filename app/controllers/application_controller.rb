# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base

  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details


  before_filter :logged_in?
  before_filter :default_headers
  before_filter :check_uri
  before_filter :goaway_conversionsupportdotcom
  #before_filter :goaway_gkcddotcn

  def check_uri
    if Rails.env == 'production' && request && (request.subdomains.first != "www" || request.protocol != 'http://')
      redirect_to "http://www.shakespeare-monologues.org" + request.path, :status => 301 and return
    end
  end

  def default_headers
    headers['X-Frame-Options'] = 'SAMEORIGIN'
  end

  def goaway_conversionsupportdotcom
    if request.remote_ip.match('8.35.201.*')
      redirect_to "http://shakespeare-monologues.org/503.html"
      return
     end
  end


  #def goaway_gkcddotcn
  #  if request.referer.match('gkcd.cn')
  #    redirect_to "http://shakespeare-monologues.org/503.html"
  #    return
  #   end
  #end


  # map gender name and id object
  GENDER = Hash.new
  Gender.all.map{|g| GENDER[g.name] = g}
  Gender.all.map{|g| GENDER[g.id] = g}
  Gender.all.map{|g| GENDER[g.id.to_s] = g}

  # Scrub sensitive parameters from your log
  # filter_parameter_logging :password

  private

  # true if user is already logged in
  def logged_in?
    if session[:user_id]
      @current_user = User.find( session[:user_id] )
    else
      @current_user = nil
    end
  end

end
