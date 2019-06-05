require 'rails_helper'

RSpec.describe CommitsController, type: :controller do
  let!(:commit) { create :commit }

  describe '#index' do
    subject { get :index }

    it { is_expected.to render_template :index }
  end

  describe '#show' do
    let(:params) { commit.attributes.compact }

    subject {get :show, params: params }

    it {is_expected.to render_template :show }
  end
  
  describe '#create' do
    let(:params) do {
      commiter_email: 'itsmatyukhin@gmail.com',
      message:        'idk just some text',
      commit_url:     'www.github.com',
      profile_url:    'www.github.com/adomant',
      commit_date:    '2019-06-01 15:42:49'
    }
    end

    it 'should create commit' do
      expect { post(:create, params: { commit: params }) }.to change(Commit, :count).by(1)
    end
  end

  describe '#destroy' do
    it 'should delete commit' do
      expect { delete :destroy, params: { id: commit.id } }.to change(Commit, :count).by(-1)
    end
  end
end
