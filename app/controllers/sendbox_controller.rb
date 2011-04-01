class SendboxController < ApplicationController
  def index
    @send_items = Message.find_all_by_from(current_user.email)
  end

  def show
    @send_item = Message.find(params[:id])
  end

  def destroy
    @send = Message.find(params[:id])
    @send.destroy

    respond_to do |format|
      format.html {redirect_to '/sendbox' }
    end
  end

end
