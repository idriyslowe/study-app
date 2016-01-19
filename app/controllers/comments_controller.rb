class CommentsController < ApplicationController
  def index
    @comments = Comment.find_by(note_page_id: params[:note_page_id])
  end
  def create
    @comment = Comment.create(
      text: params[:text],
      note_page_id: params[:note_page_id],
      user_id: current_user.id
      )
    redirect_to "/note_pages/#{@comment.note_page_id}"    
  end
  def destroy
    comment = Comment.find_by(id: params[:id])
    comment.destroy
    redirect_to "/note_pages/#{comment.note_page_id}"
  end
end
