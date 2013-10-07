class ComingsoonsController < ApplicationController
  def index
  	@title = "Coming Soon"
  	@comingsoons = Comingsoon.all
  end

  def new
  	@title = "New Movie"
  	@comingsoon = Comingsoon.new
  end

  def show
  	@comingsoon = Comingsoon.find(params[:id])
  	@title = @comingsoon.title
  end

  def edit
  	@comingsoon = Comingsoon.find(params[:id])
  	@title = "Edit #{@comingsoon.title}"
  end

  def update
  	@comingsoon = Comingsoon.find(params[:id])
  	@title = "Update #{@comingsoon.title}"

  	if @comingsoon.update_attributes(params.require(:comingsoon).permit(:title, :synopsis, :youtubestub, :category, :cinemashowing))
			redirect_to comingsoons_path, :notice => "The movie details have been successfully updated"
		else
			render "edit"
		end
  end

  def create
  	@comingsoon = Comingsoon.new(params.require(:comingsoon).permit(:title, :synopsis, :youtubestub, :category, :cinemashowing))

  	if @comingsoon.save
			redirect_to comingsoons_path, :notice => "The movie was successfully saved"
		else
			render "new"
		end
  end

  def destroy
  	@comingsoon = Comingsoon.find(params[:id])
		@comingsoon.destroy
		redirect_to comingsoons_path, :notice => "The movie has been deleted."
  end
end
