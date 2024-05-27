require 'rails_helper'

describe TasksController, type: :controller do
  describe '#index' do
    subject { get :index }

    it 'returns a success response' do
      expect(subject).to have_http_status(:ok)
    end
  end

  describe '#create' do
    subject { post :create, params: { task: task_params } }

    let(:task_params) { { title: 'title', content: 'content' } }

    it 'creates a new task' do
      expect { subject }.to change(Task, :count).by(1)
    end
  end
end
