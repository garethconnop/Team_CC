class VideosController < ApplicationController
	before_action :find_video, only: [:show, :edit, :update, :destroy]
	def index
		@videos = Video.all.order("created_at desc").paginate(page: params[:page], per_page: 12)
	end

	def new
		@video = Video.new
	end

	def create
		@video = Video.new video_params

		if @video.save
  	  redirect_to @video, notice: "The video was saved successfully!"
  	else
  	  render 'new', notice: "The video was unable to be saved!"
  	end
	end

	def show
	end

	def edit
	end

	def update
		if @video.update video_params
			redirect_to @video, notice: "The video was updated successfully!"
		else
			render 'edit'
		end
	end

	def destroy
		@video.destroy
		redirect_to videos_path
	end

	private

	def video_params
		params.require(:video).permit(:title, :length, :description, :video_id, :image)
	end

	def find_video
		@video = Video.find(params[:id])
	end
end
