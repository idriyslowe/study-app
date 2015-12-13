class EnvironmentsController < ApplicationController
  def index
    @environments = Environment.all
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
      user_id: 1)
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
  end
end
