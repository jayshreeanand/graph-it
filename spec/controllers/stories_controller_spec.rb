require 'rails_helper'

RSpec.describe StoriesController, type: :controller do
  login_user
  
  let(:valid_attributes) {
    { title: 'Test title!',
      description: 'This is a test description',
      attachment: Rack::Test::UploadedFile.new(File.open(File.join(Rails.root, '/spec/fixtures/files/story_image.jpg'))),
    }
  }

  let(:valid_session) { {} }

  describe 'GET #index' do
    it 'returns a success response' do
      get :index, params: {}, session: valid_session
      expect(response).to be_successful # be_successful expects a HTTP Status code of 200
    end
  end

  describe 'Create Story' do
    it 'creates a story and returns a success response' do
      Story.create! valid_attributes

      expect(response).to be_successful
    end
  end
end