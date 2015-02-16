class TodoItemsController < ApplicationController
	before_action :find_todo_item, only: [:update, :destory]

	def index
		@todo_item = TodoItem.new
		@all_todo_items = TodoItem.all
		if params[:complete] == "true"
			@ all_todo_items.where(complete :true)
		elsif params[:complete] == false
			@ all_todo_items.where(complete :false)
	end

	def create
		@todo_item = TodoItem.create(params.require(:todo_item).permit(:name))
			redirect_to root_url
	end

	def update
		@todo_item = TodoItem.find(params [:id])
		@todo_item.update(params, require(:todo_item).permit, :complete))
		redirect_to root_url
	end

	def change
		change_column__default :todo_items, :complete, false
		TodoItem.where(complete: nil).update.all complete :false
	end



	private
	def find_todo_item
		@todo_item = TodoItem.find(params[:id])
	end

	def redirect_to_root
		redirect_to_root_url
	end



end
