class Api::NotePagesController < ApplicationController
  def index
    @note_pages = NotePage.all
  end
  def create
    @note_pages = NotePage.create(
      title: params[:title],
      environment_id: params[:environment_id],
      summary: params[:summary]
      )
    redirect_to "/note_pages/#{@note_pages.id}"
  end
  def show
    @note_pages = NotePage.find_by(id: params[:id])
    @environments = Environment.where("status = ? AND user_id = ?", "active", current_user.id)
  end
  def update
    @note_pages = NotePage.find_by(id: params[:id])
    @note_pages.update(
      title: params[:title] || @note_pages.title, 
      environment_id: params[:environment_id] || @note_pages.environment_id, 
      summary: params[:summary] || @note_pages.summary
      )
    if @note_pages.save
      render json: { message: "success"}
    else
      render json: { errors: @note_pages.full_messages }, status: 422
    end
    # redirect_to "/note_pages/#{@note_pages.id}"
  end
  def destroy
    @note_pages = NotePage.find_by(id: params[:id])
    @note_pages.destroy
    redirect_to '/environments'
  end
end
