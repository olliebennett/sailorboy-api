require 'rails_helper'

RSpec.describe DutiesController, type: :controller do
  let(:valid_attributes) do
    {
      name: 'Safety Boat Helm',
      date: Date.today,
      time: Time.now
    }
  end

  let(:invalid_attributes) do
    { name: '' }
  end

  let(:valid_session) { {} }

  describe 'GET #index' do
    it 'assigns all duties as @duties' do
      duty = Duty.create! valid_attributes
      get :index, {}, valid_session
      expect(assigns(:duties)).to eq([duty])
    end
  end

  describe 'GET #show' do
    it 'assigns the requested duty as @duty' do
      duty = Duty.create! valid_attributes
      get :show, { id: duty.to_param }, valid_session
      expect(assigns(:duty)).to eq(duty)
    end
  end

  describe 'POST #create' do
    context 'with valid params' do
      it 'creates a new Duty' do
        expect do
          post :create, { duty: valid_attributes }, valid_session
        end.to change(Duty, :count).by(1)
      end

      it 'assigns a newly created duty as @duty' do
        post :create, { duty: valid_attributes }, valid_session
        expect(assigns(:duty)).to be_a(Duty)
        expect(assigns(:duty)).to be_persisted
      end

      it 'shows the created duty' do
        post :create, { duty: valid_attributes }, valid_session
        expect(response).to have_http_status(:created)
        expect(response).to render_template(:show)
      end
    end

    context 'with invalid params' do
      it 'assigns a newly created but unsaved duty as @duty' do
        post :create, { duty: invalid_attributes }, valid_session
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe 'PUT #update' do
    context 'with valid params' do
      let(:new_attributes) do
        { name: 'New Duty Name' }
      end

      it 'updates the requested duty' do
        duty = Duty.create! valid_attributes
        put :update,
            { id: duty.to_param, duty: new_attributes },
            valid_session
        duty.reload
        expect(duty.name).to eql('New Duty Name')
      end

      it 'assigns the requested duty as @duty' do
        duty = Duty.create! valid_attributes
        put :update,
            { id: duty.to_param, duty: valid_attributes },
            valid_session
        expect(assigns(:duty)).to eq(duty)
      end

      it 'renders the updated duty' do
        duty = Duty.create! valid_attributes
        put :update,
            { id: duty.to_param, duty: valid_attributes },
            valid_session
        expect(response).to render_template(:show)
      end
    end

    context 'with invalid params' do
      it 'assigns the duty as @duty' do
        duty = Duty.create! valid_attributes
        put :update, { id: duty.to_param, duty: invalid_attributes }, valid_session
        expect(assigns(:duty)).to eq(duty)
      end
    end
  end

  describe 'DELETE #destroy' do
    it 'destroys the requested duty' do
      duty = Duty.create! valid_attributes
      expect do
        delete :destroy, { id: duty.to_param }, valid_session
      end.to change(Duty, :count).by(-1)
      expect(response).to have_http_status(:no_content)
    end
  end
end
