class Api::NotesController < ApplicationController
  def create
    @note = Note.new(
      text: nil,
      note_page_id: params[:note_page_id],
      )
    if @note.save
      render json: { errors: @note.errors.full_messages }, status: 422
    end
  end
  def update
    @note = Note.find_by(id: params[:id])
    @note.update(
      text: params[:text] || @note.text,
      note_page_id: params[:note_page_id] || @note.note_page_id
      )
    render json: { message: "success"}
  end
  def destroy
    note = Note.find_by(id: params[:id])
    note.destroy
    render json: { message: "deleted"}
  end
end
