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
end
