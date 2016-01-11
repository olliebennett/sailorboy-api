require 'rails_helper'

RSpec.describe ClubsController do
  let(:valid_attributes) do
    { name: 'SailorBoy Sailing Club' }
  end

  let(:invalid_attributes) do
    { name: '' }
  end

  let(:valid_session) { {} }

  describe 'GET #index' do
    it 'assigns all clubs as @clubs' do
      club = Club.create! valid_attributes
      get :index, {}, valid_session
      expect(assigns(:clubs)).to eq([club])
    end
  end

  describe 'GET #show' do
    it 'assigns the requested club as @club' do
      club = Club.create! valid_attributes
      get :show, { id: club.to_param }, valid_session
      expect(assigns(:club)).to eq(club)
    end
  end

  describe 'POST #create' do
    context 'with valid params' do
      it 'creates a new Club' do
        expect do
          post :create, { club: valid_attributes }, valid_session
        end.to change(Club, :count).by(1)
      end

      it 'assigns a newly created club as @club' do
        post :create, { club: valid_attributes }, valid_session
        expect(assigns(:club)).to be_a(Club)
        expect(assigns(:club)).to be_persisted
      end

      it 'shows the created club' do
        post :create, { club: valid_attributes }, valid_session
        expect(response).to have_http_status(:created)
        expect(response).to render_template(:show)
      end
    end

    context 'with invalid params' do
      it 'assigns a newly created but unsaved club as @club' do
        post :create, { club: invalid_attributes }, valid_session
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe 'PUT #update' do
    context 'with valid params' do
      let(:new_attributes) do
        { name: 'Another Sailing Club' }
      end

      it 'updates the requested club' do
        club = Club.create! valid_attributes
        put :update,
            { id: club.to_param, club: new_attributes },
            valid_session
        club.reload
        expect(club.name).to eql('Another Sailing Club')
      end

      it 'assigns the requested club as @club' do
        club = Club.create! valid_attributes
        put :update,
            { id: club.to_param, club: valid_attributes },
            valid_session
        expect(assigns(:club)).to eq(club)
      end

      it 'renders the updated club' do
        club = Club.create! valid_attributes
        put :update,
            { id: club.to_param, club: valid_attributes },
            valid_session
        expect(response).to render_template(:show)
      end
    end

    context 'with invalid params' do
      it 'assigns the club as @club' do
        club = Club.create! valid_attributes
        put :update, { id: club.to_param, club: invalid_attributes }, valid_session
        expect(assigns(:club)).to eq(club)
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe 'DELETE #destroy' do
    it 'destroys the requested club' do
      club = Club.create! valid_attributes
      expect do
        delete :destroy, { id: club.to_param }, valid_session
      end.to change(Club, :count).by(-1)
      expect(response).to have_http_status(:no_content)
    end
  end
end
