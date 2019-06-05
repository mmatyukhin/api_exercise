require 'rails_helper'

RSpec.describe Commit, type: :model do
  let(:params) do
  {
    owner: 'adomant',
    repo: 'api_exercise',
    author_email: 'itsmatyukhin@gmail.com'
  }
  end
  describe '#load' do
    context 'When correct data provided' do
      subject {described_class.load(params)}

      it 'should be Array' do
        expect(subject.class).to eq Array
      end
    end

    context 'When no data provided' do
      let(:params) do {
        owner: '',
        repo: '',
        author_email: ''
        }
      end
      subject {described_class.load(params)}
      it 'should be NilClass' do
        expect(subject.class).to eq NilClass
      end
    end
  end
end
