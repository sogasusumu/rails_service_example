class CompanyMessageChatRoom < ChatRoom
  # @type [Array<Any>]
  def messages
    sort_messages
  end

  private

  # @type [Array<Any>]
  def list_messages
    (client_messages + user_messages)
  end

  # @type [Array<Any>]
  def sort_messages
    list_messages.sort { |a, b| b.created_at <=> a.created_at }
  end
end
