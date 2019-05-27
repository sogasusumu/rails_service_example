# frozen_string_literal: true

class ApplicationJob < ActiveJob::Base
  include Contracts::Core
  include Contracts::Builtin
end
