class RecordsController < ApplicationController

	before_action :set_record, only: [:show, :edit, :update, :destroy]

	def show
		
	end
  
	def index
		@user = current_user
		@records = @user.records.paginate(page: params[:page], per_page: 10)
	end

	def new
		@record = Record.new
	end

	def edit
	end

	def create
		@record = Record.new(record_params)
		@record.user = current_user

		if @record.save
			flash[:notice] = "Record was created successfully."
			redirect_to root_path
		else
			render 'new'
		end
		
	end

	def update
		 		
		if @record.update(record_params)
			flash[:notice] = "Record was updated successfully"
			redirect_to root_path
		else
			render 'edit'
		end
	end

	def destroy
		@record.destroy
		redirect_to root_path
	end

	def search
	  	if params[:record].present?
	  		@user = current_user
		  	@records = @user.records.search(params[:record])
		  	@count = @user.records.search(params[:record]).count
		  	if @records
		  		respond_to do |format|
		  			format.js{ render partial: 'records/record_result' }
		  		end
		  	else
		  	 	respond_to do |format|
		  	 		flash.now[:alert] = "Couldn't find record"
		  			format.js{ render partial: 'records/record_result' }
		  		end
		  	end
		else
			respond_to do |format|
	  	 		flash.now[:alert] = "Please enter first name, last name, phone or email to search.."
	  			format.js{ render partial: 'records/record_result' }
		  	end
		end
  	end

	private

	def set_record
		@record = Record.find(params[:id])
	end

	def record_params
		params.require(:record).permit(:first_name, :last_name, :address, :phone, :email)
	end

end
