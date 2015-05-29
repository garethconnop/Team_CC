class ForumsController < ApplicationController
  before_action :find_forum, only: [:show, :edit, :update, :destroy]

	def index
		@forums = Forum.all.order("created_at desc").paginate(page: params[:page], per_page: 10)
	end

	def new
		@forum = current_user.forums.build
		# @forum = Forum.new
	end

	def create
		@forum = current_user.forums.build forum_params
		# @forum = Forum.new forum_params

		if @forum.save
			redirect_to @forum, notice: "The post was saved successfully!"
		else
			render 'new', notice: "The post was unable to be saved!"
		end
	end

	def show
	end

	def edit
	end

	def update
		if @forum.update forum_params
			redirect_to @forum, notice: "The post was updated successfully!"
		else
			render 'edit'
		end
	end

	def destroy
		@forum.destroy
		redirect_to forums_path
	end

	private

	def forum_params
		params.require(:forum).permit(:title, :content)
	end

	def find_forum
		@forum = Forum.find(params[:id])
	end
end
