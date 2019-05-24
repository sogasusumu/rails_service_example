module ChatRooms::Index::ChatRoomRepository
  include Contracts::Core
  include Contracts::Builtin

  Contract nil => Hash
  def build_response
    {
        id: id,
        company_id: company_id,
        company_name: company_name,
        company_messages_count: selected_client_messages.size,
        user_id: user_id,
        user_name: user_name,
        user_messages_counts: selected_user_messages.size,
        first_message_sender: messages.first.sender,
        first_message_created_at: messages.first.created_at,
        last_message_sender: messages.last.sender,
        last_message_created_at: messages.last.created_at
    }
  end

  private

  Contract nil => ArrayOf[Or[ClientMessage, UserMessage]]
  def messages
    (selected_client_messages + selected_user_messages).sort do |a, b|
      b.created_at <=> a.created_at
    end
  end

  Contract nil => ActiveRecord::Relation
  def selected_client_messages
    client_messages.select(:id, :created_at, build_sender('client'))
  end

  Contract nil => ActiveRecord::Relation
  def selected_user_messages
    user_messages.select(:id, :created_at, build_sender('user'))
  end

  Contract String => String
  def build_sender(val)
    "\"#{val}\" AS \"sender\""
  end

  Contract nil => String
  def company_name
    @company_name ||= company.name
  end

  Contract nil => String
  def user_name
    @user_name ||= [user.first_name, user.last_name].join(' ')
  end
end
