class MessagesController < ApplicationController
    def index
      @messages = Message.all.order(created_at: :desc)
      @message = Message.new
    end
  
    def create
      @message = Message.new(message_params)
      if @message.save
        redirect_to root_path, notice: 'Meddelandet har sparats!'
      else
        @messages = Message.all.order(created_at: :desc)
        render :index
      end
    end
  
    private
  
    def message_params
      params.require(:message).permit(:name, :content)
    end
  end
  