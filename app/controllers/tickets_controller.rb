class TicketsController < ApplicationController
	before_action :require_signin!, except: [:index, :show]
	before_filter :find_project
	before_filter :find_ticket , only: [:show, :edit, :update, :destroy]
	

	def new 
		@ticket = @project.tickets.build
	end

	def show
	end

	def update
		if @ticket.update(ticket_params)
			flash[:notice] = "Ticket has been updated."

			redirect_to [@project, @ticket]
		else
			flash[:alert] = "Ticket has not been updated."

			render action: "edit"
		end
	end

	def destroy
		@ticket.destroy
		flash[:notice] = "Ticket has been deleted."

		redirect_to @project
	end

	def edit
	end



	def create
		@ticket = @project.tickets.build(ticket_params)
		@ticket.user = current_user
		if @ticket.save
			flash[:notice] = "Ticket has been created."
			redirect_to [@project, @ticket]
		else
			flash[:alert] = "Ticket has not been created."
			render :action => "new"
		end
	end

	private

	def find_project
        @project = Project.find(params[:project_id])
    end

    def find_ticket
    	@ticket = @project.tickets.find(params[:id])
    end

    def ticket_params 
    	params.require(:ticket).permit(:title, :description)
    end

end
