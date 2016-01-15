class Api::NotesController < ApplicationController
  def index
    @notes = Note.all
  end
  def new
    note = Note.new
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
    @note = Note.find_by(id: params[:id])
  end
  def update
    @note = Note.find_by(id: params[:id])
    @note.update(
      text: params[:text] || @note.text,
      note_page_id: params[:note_page_id] || @note.note_page_id
      )
    render :show
  end
  def destroy
    note = Note.find_by(id: params[:id])
    note.destroy
  end
end
