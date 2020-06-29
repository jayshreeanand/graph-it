require 'rails_helper'

RSpec.describe Story, type: :model do
  subject { 
    described_class.new(
      title: 'Test Title',
      description: 'Test Description',
      attachment: Rack::Test::UploadedFile.new(File.open(File.join(Rails.root, '/spec/fixtures/files/story_image.jpg'))),
    )  
  }

  describe 'Associations' do
    it { should belong_to(:user).without_validating_presence }
  end

  describe 'Validations' do
    it 'is valid with valid attributes' do
      expect(subject).to be_valid
    end

    it 'is not valid without a title' do
      subject.title = nil
      expect(subject).to_not be_valid
    end

    it 'is not valid without a description' do
      subject.description = nil
      expect(subject).to_not be_valid
    end

    it 'is not valid without an attachment' do
      subject.attachment = nil
      expect(subject).to_not be_valid
    end
  end
end