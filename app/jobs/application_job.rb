class ApplicationJob < ActiveJob::Base
  protected

  attr_accessor :arg_type, :arg

  # @return [String]
  def invalid_msg
    'arguments is invalid.'.freeze
  end

  # @return [StandardError]
  def raise_invalid
    raise(invalid_msg)
  end

  def valid
    tap { raise_invalid unless arg.is_a?(arg_type) }
  end

  def operate
    tap { raise('operate is not defined.') }
  end
end
