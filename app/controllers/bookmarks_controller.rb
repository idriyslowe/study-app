class BookmarksController < ApplicationController
  def index
    @bookmarks = Bookmark.all
  end
  def new
  end
  def create
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
