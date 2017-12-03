class ChatsController < ApplicationController
  def index
    @chats = Chat.all.where(user_one: current_user).or(Chat.all.where(user_two: current_user))
  end

  def show
    @chat = Chat.includes(messages: :user).find(params[:id])
  end

  def new
    @chat = Chat.new
  end

  def create
    @chat = Chat.new
    @chat.user_one = User.find(params[:chat][:user_one_id])
    @chat.user_two = User.find(params[:chat][:user_two_id])
    @chat.name = {user_one: @chat.user_one, user_two: @chat.user_two}


    if Chat.all.where(user_one_id: current_user.id).exists?(user_two_id: params[:chat][:user_two_id])
      user_chat = Chat.all.where(user_one_id: current_user.id).where(user_two_id: params[:chat][:user_two_id])[0].id
      redirect_to chat_path(user_chat), :flash => { :alert => "Chat already exists" }
    else
      if @chat.save
        redirect_to chat_path(@chat)
      else
        render 'new'
      end
    end
  end

  private

  def chat_params
    params.require(:chat).permit(:name, :user_one, :user_two)
  end
end
