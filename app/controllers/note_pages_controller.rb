class NotePagesController < ApplicationController
  def new
    @note_pages = NotePage.new
  end
  def create
    @note_pages = NotePage.create(
      title: params[:title],
      text: params[:text],
      environment_id: 1
      )
    render :show
  end
  def show
    @note_pages = NotePage.find_by(id: params[:id])
  end
  def edit
    @note_pages = NotePage.find_by(id: params[:id])
  end
  def update
    @note_pages = NotePage.find_by(id: params[:id])
    @note_pages.update(title: params[:title], text: params[:id])
    render :show
  end
  def destroy
    @note_pages = NotePage.find_by(id: params[:id])
    @note_pages.destroy
    redirect_to '/environments'
  end
end
