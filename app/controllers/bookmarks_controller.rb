class BookmarksController < ApplicationController

def new
  @bookmark = Bookmark.new
end

def create
  @bookmark = Bookmark.new(bookmark_params)
    if @bookmark.save
      redirect_to list_path(@list)
    else
      render :new
    end
end

def bookmark_params
  params.require(:bookmark).permit(:comment)
end

def destroy
  @bookmark = Bookmark.find(params[:id])
  @bookmark.destroy
    redirect_to list_path(@bookmark.list)
end

end
