class CompanyMessagesReceiveJob < ApplicationJob
  queue_as :default

  # @param arg [ActionController::Parameters]
  def perform(arg)
    @arg_type = ActionController::Parameters
    @arg = arg
    valid
    operate
  end

  # @return [CompanyMessageOperationJob]
  def operate
    tap { arg.permit! }
  end
end
