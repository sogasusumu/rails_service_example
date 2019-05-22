class CompanyMessagesController < ApplicationController
  def index
    CompanyMessagesReceiveJob
        .perform_now(params)
        .yield_self { |p| CompanyMessagesOperationJob.perform_now(p) }
        .yield_self { |o| CompanyMessagesSerializeJob.perform_now(o) }
        .yield_self { |s| render json: s }
  end
end
