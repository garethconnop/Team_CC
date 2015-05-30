class VideosController < ApplicationController
	before_action :find_video, only: [:show, :edit, :update, :destroy]
    before_action :authenticate_user!, except: [:index, :show]

	def index
		if params[:video_category].blank?
			@videos = Video.all.order("created_at desc").paginate(page: params[:page], per_page: 12)
		else
			@category_id = VideoCategory.find_by(name: params[:video_category]).id
			@videos = Video.where(video_category: @category_id).order("created_at desc").paginate(page: params[:page], per_page: 12)
		end
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
		params.require(:video).permit(:title, :length, :description, :video_id, :image, :slug, :video_category_id)
	end

	def find_video
		@video = Video.friendly.find(params[:id])
	end
end
