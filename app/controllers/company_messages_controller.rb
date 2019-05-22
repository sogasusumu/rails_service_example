class CompanyMessagesController < ApplicationController
  def index
    Rails.logger.info(params.class)
    CompanyMessagesReceiveJob
        .perform_now(params)
        .yield_self { |p| CompanyMessageOperationJob.perform_now(p) }
        .yield_self { |o| CompanyMessageSerializeJob.perform_now(o) }
        .yield_self { |s| render json: s }
  end
end
