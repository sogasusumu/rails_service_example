# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'CharRoomsControllers', type: :request do
  describe 'GET /char_rooms_controllers' do
    it 'works! (now write some real specs)' do
      get company_chat_rooms_path, company_id: 1
      expect(response).to have_http_status(200)
    end
  end
end
