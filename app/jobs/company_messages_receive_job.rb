class CompanyMessagesReceiveJob < ApplicationJob
  queue_as :default

  # @param arg [ActionController::Parameters]
  def perform(arg)
    @arg_type = ActionController::Parameters
    @arg = arg
    valid
    operate
  end

  # @return [CompanyMessagesOperationJob]
  def operate
    tap { arg.permit! }
  end
end
