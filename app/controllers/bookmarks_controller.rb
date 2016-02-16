class BookmarksController < ApplicationController
  def show
    @bookmark = Bookmark.find_by(id: params[:id])
  end
end
