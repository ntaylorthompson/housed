class ApplicationController < ActionController::Base
  protect_from_forgery
  include SessionsHelper

  def remit
    @remit ||= begin
      sandbox = !Rails.env.production?
      Remit::API.new(FPS_ACCESS_KEY, FPS_SECRET_KEY, sandbox)
    end
  end

end
