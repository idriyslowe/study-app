class EnvironmentsController < ApplicationController
  def index
    @environments = Environment.where("status = ? AND user_id = ?", "active", current_user.id)
  end
  def new
    @environment = Environment.new
    @environments = Environment.where("status = ? AND user_id = ?", "active", current_user.id)
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
    @environment = Environment.find_by(id: params[:id])
    @environments = Environment.where("status = ? AND user_id = ?", "active", current_user.id)
  end
  def edit
    @environment = Environment.find_by(id: params[:id])
    @environments = Environment.where("status = ? AND user_id = ?", "active", current_user.id)
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
