class VideoCommentsController < ApplicationController
	before_action :find_video
  before_action :authenticate_user!

  def create
		@video_comment = @video.video_comments.create(params[:video_comment].permit(:video_comment))
    @video_comment.user_id = current_user.id if current_user
    @video_comment.save

		if @video_comment.save
			redirect_to video_path(@video, anchor: "video_comment_#{@video_comment.id}")
		else
			redirect_to video_path(@video), alert: "Unable to save your comment"
		end
	end

	def edit
		@video_comment = @video.video_comments.find(params[:id])
	end

	def update
		@video_comment = @video.video_comments.find(params[:id])

		if @video_comment.update(params[:video_comment].permit(:video_comment))
			redirect_to video_path(@video, anchor: "video_comment_#{@video_comment.id}")
		else
			render 'edit'
		end
	end

	def destroy
		@video_comment = @video.video_comments.find(params[:id])
		@video_comment.destroy
		redirect_to video_path(@video)
	end

	private

	def find_video
		@video = Video.find_by_slug(params[:video_id])
	end
end
