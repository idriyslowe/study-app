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
      user_id: current_user.id,
      image_path: 'http://cdn.shopify.com/s/files/1/0072/7502/products/8888a_08727881-0ac8-442c-b843-b26b7be897e9.jpg?v=1438190485')
    redirect_to '/environments'
  end
  def show
    @environment = Environment.find_by(id: params[:id])
    @environments = Environment.where("status = ? AND user_id = ?", "active", current_user.id)
  end
  def archived
    @environments = Environment.where("status = ? AND user_id = ?", "archive", current_user.id)
  end
  def edit
    @environment = Environment.find_by(id: params[:id])
    @environments = Environment.where("status = ? AND user_id = ?", "active", current_user.id)
  end
  def update
    environment = Environment.find_by(id: params[:id])
    environment.update(
    name: params[:name],
    status: params[:status],
    image_path: params[:image_path])
    redirect_to '/environmenst/#{environment.id}'
  end
  def destroy
    environment = Environment.find_by(id: params[:id])
    environment.update(status: "archive")
    redirect_to '/environments'
  end
  def reactivate
    environment = Environment.find_by(id: params[:id])
    environment.update(status: "active")
    redirect_to '/environments'
  end
end
