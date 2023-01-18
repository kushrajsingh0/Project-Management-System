class HomeController < ApplicationController
  def index
    @projects = Project.all
    @tasks = Task.all
    @users = User.all
  end
  def updateStatus
    @taskToUpdate = Task.find(params[:task])
    @status = params[:statusVal]
    @taskToUpdate.update_attribute(:status, @status)
    redirect_to(home_index_url)
  end
  def postComment
    comment_hash = {}
    comment_hash[:user_id] = params[:user_id]
    comment_hash[:task_id] = params[:task_id]
    comment_hash[:commentText] = params[:commentText]
    @comment = Comment.new(comment_hash)
    if @comment.save
      flash[:notice]="Comment posted successfully..."
      redirect_to(home_index_url)
    else
      flash[:notice]="Error posting comment..."
      redirect_to(home_index_url)
    end
  end
end

