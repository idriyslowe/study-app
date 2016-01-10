class NotesController < ApplicationController
  def index
  end
  def new
    @note = Note.new
  end
  def create
    @note = Note.create(
      text: params[:text],
      note_page_id: params[:id],
      )
  end
  def show
  end
  def update

  end
  def destroy
    note = Note.find_by(id: params[:id])
    note.destroy
    redirect_to '/note_pages/:id'
  end
end
