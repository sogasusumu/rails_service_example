class CompanyMessageSerializeJob < ApplicationJob
  queue_as :default

  # @param arg [Array<Any>]
  def perform(arg)
    @arg_type = Array
    @arg = arg
    valid
    operate
  end

  protected

  # @return [Array<Any>]
  def operate
    arg
  end
end
