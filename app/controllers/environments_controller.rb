class EnvironmentsController < ApplicationController
  def index
    @environments = Environment.where("status = ? AND user_id = ?", "active", current_user.id)
  end
  def new
    @environments = Environment.new
  end
  def create
    @environments = Environment.create(
      name: params[:name], 
      status: "active", 
      last_used: 1, 
      visit_count: 1, 
      user_id: current_user.id)
    redirect_to '/environments'
  end
  def show
    @environments = Environment.find_by(id: params[:id])
  end
  def edit
    @environments = Environment.find_by(id: params[:id])
  end
  def update
    environment = Environment.find_by(id: params[:id])
    environment.update(name: params[:name], status: params[:status])
    redirect_to '/environments'
  end
  def destroy
    environment = Environment.find_by(id: params[:id])
    environment.update(status: "archive")
    redirect_to '/environments'
  end
end
