class LogsController < ApplicationController

	def new
		@log = Log.new(user_id: current_user.id)
	end

	def create
		@log = Log.create(log_params)
		if @log.save
			redirect_to root_path
		else
			render :new
		end
	end

	def log_params
		params.require(:log).permit(:location, :time, :people, :activity, :ate, :drink, :bing, :vomit_laxative, :triggers, :thoughts, :emotions, :exercise, :exercise_description, :amount_exercise, :exercise_time, :user_id)
	end
end
