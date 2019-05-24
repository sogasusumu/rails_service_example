class ApplicationJob < ActiveJob::Base
  include Contracts::Core
  include Contracts::Builtin
end
