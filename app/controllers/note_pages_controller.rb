class NotePagesController < ApplicationController
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
    @note_pages.update(title: params[:title], summary: params[:summary], id: params[:id])
    redirect_to "/note_pages/#{@note_pages.id}"
  end
  def destroy
    @note_pages = NotePage.find_by(id: params[:id])
    @note_pages.destroy
    redirect_to '/environments'
  end

  def show_working
    @note_pages = NotePage.find_by(id: params[:id])
    @environments = Environment.where("status = ? AND user_id = ?", "active", current_user.id)
  end
end
