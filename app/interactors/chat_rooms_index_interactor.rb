# frozen_string_literal: true

class ChatRoomsIndexInteractor < ApplicationJob
  queue_as :default

  def perform(params)
    @params = params
    response
  end

  private

  attr_reader :params

  Contract nil => Integer
  def company_id
    Integer(params[:company_id])
  end

  Contract nil => Company
  def company
    Company.find(company_id).extend(ChatRooms::Index::CompanyRepository)
  end

  Contract nil => ArrayOf[Hash]
  def response
    company.build_response
  end
end
