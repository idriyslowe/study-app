class Api::BookmarksController < ApplicationController
  def index
    @bookmarks = Bookmark.all
  end
  def new
  end
  def create
    @bookmark = Bookmark.new(
      name: "From Extension",
      path: params[:path],
      note_id: params[:note_id],
      screenshot_data: params[:screenshot_data],
      user_id: current_user.id
      )
    # @incoming_file = params[:screenshot_data]
    # file_name = current_user.handle + "#{DateTime.now}"
    # FileUtils.mv @incoming_file.tempfile, "/Users/igrant/acltc/study-app/public/png/#{file_name}"
    if @bookmark.save
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
