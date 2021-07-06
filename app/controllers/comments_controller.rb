class CommentsController < ApplicationController

	before_action :set_comment

	def create

		# @record = Record.find(params[:record_id])

		@comment = @record.comments.create(params.require(:comment).permit(:add_comment))

		redirect_to record_path(@record)
	end

	def destroy

		# @record = Record.find(params[:recor
		@comment = @record.comments.find(params[:id])
		@comment.destroy
		redirect_to record_path(@record)
		
		
	end

	private

	def set_comment
		@record = Record.find(params[:record_id])
	end


end