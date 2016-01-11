require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  let(:valid_attributes) do
    { name: 'Ollie' }
  end

  let(:invalid_attributes) do
    { name: '' }
  end

  let(:valid_session) { {} }

  describe 'GET #index' do
    it 'assigns all users as @users' do
      user = User.create! valid_attributes
      get :index, {}, valid_session
      expect(assigns(:users)).to eq([user])
    end
  end

  describe 'GET #show' do
    it 'assigns the requested user as @user' do
      user = User.create! valid_attributes
      get :show, { id: user.to_param }, valid_session
      expect(assigns(:user)).to eq(user)
    end
  end

  describe 'POST #create' do
    context 'with valid params' do
      it 'creates a new User' do
        expect do
          post :create, { user: valid_attributes }, valid_session
        end.to change(User, :count).by(1)
      end

      it 'assigns a newly created user as @user' do
        post :create, { user: valid_attributes }, valid_session
        expect(assigns(:user)).to be_a(User)
        expect(assigns(:user)).to be_persisted
      end

      it 'shows the created user' do
        post :create, { user: valid_attributes }, valid_session
        expect(response).to have_http_status(:created)
        expect(response).to render_template(:show)
      end
    end

    context 'with invalid params' do
      it 'assigns a newly created but unsaved user as @user' do
        post :create, { user: invalid_attributes }, valid_session
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe 'PUT #update' do
    context 'with valid params' do
      let(:new_attributes) do
        { name: 'Ben' }
      end

      it 'updates the requested user' do
        user = User.create! valid_attributes
        put :update,
            { id: user.to_param, user: new_attributes },
            valid_session
        user.reload
        expect(user.name).to eql('Ben')
      end

      it 'assigns the requested user as @user' do
        user = User.create! valid_attributes
        put :update,
            { id: user.to_param, user: valid_attributes },
            valid_session
        expect(assigns(:user)).to eq(user)
      end

      it 'renders the updated user' do
        user = User.create! valid_attributes
        put :update,
            { id: user.to_param, user: valid_attributes },
            valid_session
        expect(response).to render_template(:show)
      end
    end

    context 'with invalid params' do
      it 'fails to update the requested user' do
        user = User.create! valid_attributes
        put :update,
            { id: user.to_param, user: invalid_attributes },
            valid_session
        expect(assigns(:user)).to eq(user)
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe 'DELETE #destroy' do
    it 'destroys the requested user' do
      user = User.create! valid_attributes
      expect do
        delete :destroy, { id: user.to_param }, valid_session
      end.to change(User, :count).by(-1)
      expect(response).to have_http_status(:no_content)
    end
  end
end
