class NotesController < ApplicationController
  def index
  end
  def new
    @note = Note.new
  end
  def create
    @notes = Note.create(
      )
  end
  def show
  end
  def edit
  end
  def update
  end
  def destroy
    note = Note.find_by(id: params[:id])
    note.destroy
    redirect_to '/note_pages/:id'
  end
end
