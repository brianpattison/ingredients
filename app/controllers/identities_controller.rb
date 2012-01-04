class IdentitiesController < ApplicationController
  before_filter :authenticate
  
  def new
    @identity = env['omniauth.identity']
  end
  
  def index
    @identities = Identity.all
  end
  
  def destroy
    @identity = Identity.find(params[:id])
    @identity.destroy

    respond_to do |format|
      format.html { redirect_to identities_url }
      format.json { head :ok }
    end
  end
end