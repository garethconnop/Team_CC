class ProgramsController < ApplicationController
	before_action :find_program, only: [:show, :edit, :update, :destroy]
	before_action :find_program_part, only: [:show]
  before_action :authenticate_user!, except: [:index]
  before_action :authenticate_admin, only: [:new, :create, :edit, :update, :destroy]

	def index
    @programs = Program.all.order("created_at desc").paginate(page: params[:page], per_page: 1)
	end

	def new
		@program = Program.new
	end

	def create
		@program = Program.new program_params

		if @program.save
  	  redirect_to programs_path, notice: "Program was created successfully!"
  	else
  	  render 'new', notice: "Unable to save program!"
  	end
	end

	def show
	end

	def edit
	end

	def update
		if @program.update program_params
			redirect_to programs_path, notice: "Program was updated successfully!"
		else
			render 'edit', notice: "Program was succesfully updated!"
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
		params.require(:program).permit(:title, :description)
	end

	def find_program
		if params[:id].nil?
      @program = current_program
		else
		  @program = Program.find(params[:id])
		end
	end

	def find_program_part
		@program_parts = ProgramPart.where(program_id: @program).order("created_at desc").paginate(page: params[:page], per_page: 1)
	end
		
end
