require 'spec_helper'

describe VotersController, type: :controller do
  let(:voter_attributes) { attributes_for :voter }

  describe 'GET #new' do
    before do 
      get :new
    end

    it 'sets @voter' do
      expect(assigns(:voter)).to be_a Voter
    end
  end

  describe 'POST #create' do
    context 'with valid params' do
      it 'creates a new voter' do 
        expect {
          post :create, voter: voter_attributes
        }.to change{ Voter.count }.by 1
      end

      it 'renders the create template' do
        post :create, voter: voter_attributes
        expect(response).to render_template :create
      end
    end

    context 'with invalid params' do
      before do
        allow_any_instance_of(Voter).to receive(:save).and_return(false)
      end

      it 'rerenders the new template' do
        post :create, voter: voter_attributes
        expect(response).to render_template :new
      end
    end
  end
end
