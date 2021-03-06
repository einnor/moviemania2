class NowshowingsController < ApplicationController

	before_action :load_cinema
	before_action :set_nowshowing, only: [:show, :edit, :update, :destroy]

  def index
  	@nowshowings = @cinema.nowshowings
  	@title = "Now Showing"
  end

  def new
  	@nowshowing = @cinema.nowshowings.build
  	@title = "New Now Showing"
  end

  def edit
  	@title = "Edit #{@nowshowing.title}"
  end

  def show
  	@title = @nowshowing.title
  end

  def update
  	@title = "Update #{@nowshowing.title}"

  	if @nowshowing.update_attributes(nowshowing_params)
			redirect_to cinema_nowshowings_path, :notice => "The movie details have been successfully updated"
		else
			render "edit"
		end
  end

  def create
  	@nowshowing = @cinema.nowshowings.build(nowshowing_params)

  	if @nowshowing.save
			redirect_to cinema_nowshowings_path, :notice => "The movie was successfully saved."
		else
			render "new"
		end
  end

  def destroy
		@nowshowing.destroy
		redirect_to cinema_nowshowings_path, :notice => "The movie has been successfully deleted."
  end

  private

  def load_cinema
  	@cinema = Cinema.find(params[:cinema_id])
  end

  def set_nowshowing
  	@nowshowing = @cinema.nowshowings.find(params[:id])
  end

  def nowshowing_params
  	params.require(:nowshowing).permit(:title, :synopsis, :youtubestub, :price, :category, :nowshowingcover, :screening_time)
  end
end
