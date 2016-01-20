class Api::BookmarksController < ApplicationController
  def index
    @bookmarks = Bookmark.all
  end

  def new
  end
  
  def create
    data = params[:screenshot_data]
    filename = "#{SecureRandom.urlsafe_base64}.png" 
    File.open(Rails.root.join('public', filename), 'wb') do |f|
      f.write(Base64.decode64(data['data:image/png;base64,'.length .. -1]))
    end
    @bookmark = Bookmark.new(
      name: "From Extension",
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
  
  def show
    @bookmark = Bookmark.find_by(id: params[:id])
  end
  
  def edit
  end
  
  def update
  end
  
  def destroy
  end
end
