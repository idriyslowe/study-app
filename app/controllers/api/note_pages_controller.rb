class Api::NotePagesController < ApplicationController
  def index
    @note_pages = NotePage.all
  end
  def new
    @note_pages = NotePage.new
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
  def edit
    @note_pages = NotePage.find_by(id: params[:id])
  end
  def update
    @note_pages = NotePage.find_by(id: params[:id])
    @note_pages.update(title: params[:title], text: params[:text], summary: params[:summary], id: params[:id])
    redirect_to "/note_pages/#{@note_pages.id}"
  end
  def destroy
    @note_pages = NotePage.find_by(id: params[:id])
    @note_pages.destroy
    redirect_to '/environments'
  end
end