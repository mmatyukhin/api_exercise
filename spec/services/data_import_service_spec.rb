require 'rails_helper'

RSpec.describe DataImportService, type: :service do
  let(:params) do
  {
    owner: 'adomant',
    repo: 'api_exercise',
    author_email: 'itsmatyukhin@gmail.com'
  }
  end
  context 'when correct search_params provided' do
    let(:instance) {described_class.new(params)}
    subject {instance.get_commits}
    it 'should get Array' do
      expect(subject.class).to eq Array
    end
  end
  context 'when wrong search_params provided' do
    let(:wrong_params) do
      {
        owner: 'adomofd',
        repo: 'testetst',
        author_email: 'fdosfko'
      }
    end
    let(:instance) {described_class.new(wrong_params)}
    subject {instance.get_commits}
    it 'should get Hash' do
      expect(subject.class).to eq Hash
    end
    it 'should get message' do
      expect(subject["message"]).to eq "Not Found"
    end
  end

end
