class TasksController < ApplicationController
  respond_to :json

  def index
    respond_with Task.all
  end

  def create
    p params[:format]
    @task = Task.create(task_params)

    respond_to do |format|
      # format.html { redirect_to root_path }
      format.json { render :json => @task}
      # else
      #   format.html { redirect_to root_path }
      #   format.json { render :json => @task.errors.to_a, :status => :unprocessable_entity }
      # end
    end
  end

  private

    def task_params
      params.require(:task).permit(:title)
    end

end
