
class ChatController < ApplicationController
  
  def message_sent
    @update = {:lines => params[:lines], :name => params[:name]}
    
    Pusher['chat'].trigger "message_sent", @update
    
    render :update do |page|
      page[:lines].clear
      page[:lines].focus
    end
  end
  
end
