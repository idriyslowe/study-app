class NotesController < ApplicationController
  def index
  end
  def new
    @note = Note.new
  end
  def create
    @note = Note.create(
      text: nil,
      note_page_id: params[:id],
      )
  end
  def show
  end
  def update
    @note = Note.find_by(id: params[:id])
    @note.update(
      text: params[:text],
      note_page_id: params[:note_page_id]
      )
    redirect_to "/note_pages/#{@note.note_page_id}"
  end
  def destroy
    note = Note.find_by(id: params[:id])
    note.destroy
    redirect_to '/note_pages/:id'
  end
end
