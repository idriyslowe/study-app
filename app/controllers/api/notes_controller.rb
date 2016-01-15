class Api::NotesController < ApplicationController
  def index
    @notes = Note.all
  end
  def new
    note = Note.new
    note_page = NotePage.find_by(id: params[:note_page_id])
  end
  def create
    @note = Note.new(
      text: nil,
      note_page_id: params[:note_page_id],
      )
    if @note.save
      render json: { errors: @note.errors.full_messages }, status: 422
    end
  end
  def show
  end
  def update
    @note = Note.find_by(id: params[:id])
    @note.update(
      text: params[:text],
      note_page_id: params[:note_page_id]
      )
  end
  def destroy
    note = Note.find_by(id: params[:id])
    note.destroy
  end
end
