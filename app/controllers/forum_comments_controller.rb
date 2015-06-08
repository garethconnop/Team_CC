class ForumCommentsController < ApplicationController
	before_action :find_forum
  before_action :authenticate_user!

	def create
		@forum_comment = @forum.forum_comments.create(params[:forum_comment].permit(:forum_comment))
    @forum_comment.user_id = current_user.id if current_user
    @forum_comment.save

		if @forum_comment.save
			redirect_to forum_path(@forum, anchor: "forum_comment_#{@forum_comment.id}")
		else
			redirect_to forum_path(@forum), alert: "Unable to save your comment"
		end
	end

	def edit
		@forum_comment = @forum.forum_comments.find(params[:id])
	end

	def update
		@forum_comment = @forum.forum_comments.find(params[:id])

		if @forum_comment.update(params[:forum_comment].permit(:forum_comment))
			redirect_to forum_path(@forum, anchor: "forum_comment_#{@forum_comment.id}")
		else
			render 'edit'
		end
	end

	def destroy
		@forum_comment = @forum.forum_comments.find(params[:id])
		@forum_comment.destroy
		redirect_to forum_path(@forum)
	end

	private

	def find_forum
		@forum = Forum.find(params[:forum_id])
	end
end
