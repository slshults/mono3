# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details

config.middleware.insert 0, 'Rack::Rewrite' {} do
  r301 %r{.*}, 'http://canonical-domain.com$&',
  :if => Proc.new { |rack_env| rack_env['SERVER_NAME'] != 'www.shakespeare-monologues.org' }
end


  before_filter :logged_in?
  before_filter :default_headers

    def default_headers
      headers['X-Frame-Options'] = 'SAMEORIGIN'
    end

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
