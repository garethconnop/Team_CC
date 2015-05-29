class ForumCommentsController < ApplicationController
	def create
		@forum = Forum.find(params[:forum_id])
		@forum_comment = @forum.forum_comments.create(params[:forum_comment].permit(:forum_comment))
    @forum_comment.user_id = current_user.id if current_user
    @forum_comment.save

		if @forum_comment.save
			redirect_to forum_path(@forum)
		else
			render 'new'
		end
	end
end
