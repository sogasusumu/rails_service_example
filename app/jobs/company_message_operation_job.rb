class CompanyMessageOperationJob < ApplicationJob
  queue_as :default

  # @param arg [CompanyMessagesReceiveJob]
  def perform(arg)
    @arg_type = CompanyMessagesReceiveJob
    @arg = arg
    valid
    operate
  end

  protected

  # @return [CompanyMessageOperationJob]
  def operate
    CompanyMessageChatRoom.first.messages
  end
end
