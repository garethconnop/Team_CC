class ForumsController < ApplicationController
  before_action :find_forum, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]

	def index
		if params[:forum_category].blank?
		  @forums = Forum.all.order("created_at desc").paginate(page: params[:page], per_page: 10)
		else
			@category_id = ForumCategory.find_by(name: params[:forum_category]).id
			@forums = Forum.where(forum_category: @category_id).order("created_at desc").paginate(page: params[:page], per_page: 10)
		end
	end

	def new
		@forum = current_user.forums.build
	end

	def create
		@forum = current_user.forums.build forum_params

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

	def active
		@forums = Forum.active.order("created_at desc").paginate(page: params[:page], per_page: 10)
		render action: :index
	end

	def unanswered
		@forums = Forum.unanswered.order("created_at desc").paginate(page: params[:page], per_page: 10)
		render action: :index
	end

	def my_posts
		@forums = current_user.forums.order("created_at desc").paginate(page: params[:page], per_page: 10)
		render action: :index
	end

	private

	def forum_params
		params.require(:forum).permit(:title, :content, :forum_category_id)
	end

	def find_forum
		@forum = Forum.find(params[:id])
	end
end
