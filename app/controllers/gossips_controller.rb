class GossipsController < ApplicationController
  def new
    @gossip = Gossip.new
  end

  def show
    @gossip = Gossip.find(params[:id])
  end

  def create
    gossip = Gossip.new
    gossip.user = current_user
    gossip.content = params[:gossip][:content]
    gossip.save
    flash[:notice] = "Gossip Completed"
    redirect_to home_path
  end

  def destroy
    gossip = Gossip.find(params[:id])
    gossip.destroy
    redirect_to home_path
  end

end
