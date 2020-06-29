require 'rails_helper'

# Change this StoriesController to your project
RSpec.describe StoriesController, type: :controller do

    # This should return the minimal set of attributes required to create a valid
    # Article. As you add validations to Article, be sure to adjust the attributes here as well.
    login_user
    
    let(:valid_attributes) {
        { title: 'Test title!', description: 'This is a test description' }
    }

    let(:valid_session) { {} }

    describe 'GET #index' do
        it 'returns a success response' do
            Story.create! valid_attributes
            get :index, params: {}, session: valid_session
            expect(response).to be_successful # be_successful expects a HTTP Status code of 200
            # expect(response).to have_http_status(302) # Expects a HTTP Status code of 302
        end
    end
end