# frozen_string_literal: true

require 'rails_helper'
require 'apipie/rspec/response_validation_helper'

RSpec.describe ChatRoomsController, type: :controller, show_in_doc: true do
  describe 'GET #index' do
    render_views

    it 'returns http success' do
      response = get :index, format: :json
      expect(response).to match_declared_responses
    end
  end
end
