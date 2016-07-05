class Api::BookmarksController < ApplicationController

  def create
    data = params[:screenshot_data]
    filename = "#{SecureRandom.urlsafe_base64}.png" 
    File.open(Rails.root.join('public', filename), 'wb') do |f|
      f.write(Base64.decode64(data['data:image/png;base64,'.length .. -1]))
    end
    @bookmark = Bookmark.new(
      name: Time.now.strftime("%A, %d %b %Y %l:%M %p"),
      path: params[:path],
      note_id: params[:note_id],
      user_id: current_user.id,
      screenshot_data: filename
      )
    if @bookmark.save
      render json: { message: "success"}
    else
      render json: { errors: @bookmark.full_messages }, status: 422
    end
  end
  
  # I DONT THINK I NEED TO INCLUDE THE ATTRIBUTES I WON'T BE UPDATING
  def update
    bookmark = Bookmark.find_by(id: params[:id])
    bookmark.update(
      name: bookmark.name,
      path: bookmark.path,
      note_id: params[:note_id],
      user_id: current_user.id,
      screenshot_data: bookmark.screenshot_data
      )
    if bookmark.save
      render json: { message: "success"}
    else
      render json: { errors: bookmark.full_messages }, status: 422
    end
  end
  
  def destroy
  end
end
