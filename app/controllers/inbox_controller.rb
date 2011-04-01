class InboxController < ApplicationController
  def index
    #    @inbox = Message.all
    @sample = Message.find_all_by_to(current_user.email)
  end

  def show
    @exe = Message.find(params[:id])
    @from = @exe.from
    @date = @exe.date
    @subject = @exe.subject
    @body = @exe.body
    
  end

  def destroy
  end

end
