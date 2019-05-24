class ChatRoomsController < ApplicationController
  def_param_group :chat_room do
    property :id, Integer, require: true, desc: 'chat_room_id'
    property :company_id, Integer, require: true
    property :company_name, String, require: true
    property :company_messages_counts, Integer, require: true
    property :user_id, Integer, require: true
    property :user_name, String, require: true
    property :user_messages_counts, Integer, require: true
    property :first_message_sender, String, require: true
    property :first_message_created_at, DateTime, require: true
    property :last_message_sender, String, require: true
    property :last_message_created_at, DateTime, require: true
  end

  api :GET, '/companies/:company_id/chat_rooms', "show company's chat rooms ."
  param :company_id, :number, desc: 'company id', reqire: true
  returns array_of: :chat_room, code: 200, desc: 'success'
  def index
    render json: ChatRoomsIndexInteractor.perform_now(params)
  end
end
