class ProgramsController < ApplicationController
	before_action :find_program, only: [:edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index]
  before_action :authenticate_admin, only: [:new, :create, :edit, :update, :destroy]

	def index
    @programs = Program.all.order("created_at desc").paginate(page: params[:page], per_page: 10)
	end

	def new
		@program = Program.new
	end

	def create
		@program = Program.new program_params

		if @program.save
  	  redirect_to programs_path, notice: "The program was created successfully!"
  	else
  	  render 'new', notice: "The program was unable to be saved!"
  	end
	end

	def edit
	end

	def update
		if @program.update program_params
			redirect_to programs_path, notice: "The program was updated successfully!"
		else
			render 'edit'
		end
	end

	def destroy
		@program.destroy
		redirect_to programs_path
	end

	private

	def authenticate_admin
		unless current_user.admin?
			redirect_to programs_path, notice: "You're not supposed to be in there."
		end
	end

	def program_params
		params.require(:program).permit(:title, :description, :pdf)
	end

	def find_program
		@program = Program.find(params[:id])
	end
end
