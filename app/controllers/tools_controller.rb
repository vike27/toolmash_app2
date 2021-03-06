class ToolsController < ApplicationController
before_action :set_tool, only:[:show, :edit, :update, :destroy]
before_action :authenticate_user!, only:[:new, :destroy, :edit, :manage], notice: 'you must be logged in to proceed'

	def index
		if params[:search]
			@tools = Tool.search(params[:search]).order("created_at DESC")
		else
			@tools = Tool.all.order('created_at DESC')
		end
	end

	def manage
		@user = current_user 
		@tools = @user.tools
	end
	
	def show
	end

	def new
    	@tool = Tool.new 
	end

	def create
		@tool = Tool.new(tool_params)
		if @tool.save
			redirect_to @tool
		else
			redirect_to :action => "new"
			flash[:notice] = "You did not fill out all the fields"
		end
	end

	def edit
	end

	def update
		@tool.update(tool_params)
		redirect_to @tool
	end

	def destroy
		@tool.destroy
		redirect_to tools_path
	end

	private

	def set_tool
		@tool = Tool.find(params[:id])
	end

	def tool_params
		params.require(:tool).permit(:name, :description, :user_id, :tool_image, :rent_price, :blurb)
	end

end
