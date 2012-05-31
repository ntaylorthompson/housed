class HostsController < ApplicationController
  def show
#    if params[:web_string]
    id = Show.find_by_web_string(params[:web_string]).host.id
    @host = Host.find(id)
#    end
  end
end
