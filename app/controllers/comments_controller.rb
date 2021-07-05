class CommentsController < ApplicationController

	def create

		@comment = Comment.create(params.require(:comment).permit(:add_comment))

		if @comment
			flash[:notice] = "Comment was added successfully."
			redirect_to root_path
		else
			flash[:alert] = "There was somwthing wrong in adding a comment"
		end
	end


end