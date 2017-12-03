class ChatsChannel < ApplicationCable::Channel
  def subscribed
    stream_from "chat_#{params[:chat_room_id]}"
  end
end
