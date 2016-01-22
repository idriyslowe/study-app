class BookmarksController < ApplicationController
  def index
    @bookmarks = Bookmark.all
  end
  def new
  end
  def create
    @bookmark = Bookmark.create(
      name: params[:name],
      path: params[:path],
      note_id: nil
      )
  end
  def show
    @bookmark = Bookmark.find_by(id: params[:id])
  end
  def edit
  end
  def update
    @bookmark = Bookmark.find_by(id: params[:id])
    @bookmark.update(
      name: params[:name],
      note_id: params[:note_id]
      )
  end
  def destroy
  end
end
