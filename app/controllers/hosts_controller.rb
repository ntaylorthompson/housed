class HostsController < ApplicationController
  def show
#    if params[:web_string]
    @show = Show.find_by_web_string(params[:web_string])
    @user = @show.user
    id = @show.host.id
    @host = Host.find(id)
#    end
  end
end
