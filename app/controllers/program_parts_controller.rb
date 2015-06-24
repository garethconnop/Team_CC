class ProgramPartsController < ApplicationController
  before_action :find_program
  before_action :find_program_part, only: [:edit, :update, :destroy]
  before_action :authenticate_user!
  before_action :authenticate_admin, only: [:new, :create, :edit, :update, :destroy]

	def new
		@program_part = ProgramPart.where(program_id: @program)
		@program_part = @program.program_parts.new
	end

	def create
		@program_part = @program.program_parts.new program_part_params
		if @program_part.save
			redirect_to program_path(@program), notice: "Episode was created successfully!"
		else
			render 'new', notice: "Unable to save episode!"
		end
	end

	def edit
	end

	def update
		if @program_part.update program_part_params
      redirect_to program_path(@program), notice: "Episode was succesfully updated!"
		else
      render 'edit'
		end
	end

	def destroy
		@program_part.destroy
		redirect_to program_path(@program)
	end

	private

	def authenticate_admin
		unless current_user.admin?
			redirect_to programs_path, notice: "You're not supposed to be in there."
		end
	end

	def program_part_params
		params.require(:program_part).permit(:title, :description, :pdf)
	end

	def find_program
		@program = Program.find_by_slug(params[:program_id])
	end

	def find_program_part
		@program_part = @program.program_parts.find(params[:id])
	end
end
