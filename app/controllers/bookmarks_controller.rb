class BookmarksController < ApplicationController
  def new
    @list = List.find(params[:list_id])
    @bookmark = Bookmark.new()
  end
  def create
    # rise
    @list = List.find(params[:list_id])
    @bookmark = Bookmark.new(comment: params[:bookmark][:comment])
    @bookmark.list = @list
    @movie = Movie.find(params[:bookmark][:movie_id].to_i)
    @bookmark.movie = @movie
    if @bookmark.save
      redirect_to list_path(@list)
    else
      render :new, status: :unprocessable_entity
    end
  end
  def destroy
    @bookmark = Bookmark.find(params[:id])
    @list = @bookmark.list
    @bookmark.destroy
    redirect_to list_path(@list)
  end
end
