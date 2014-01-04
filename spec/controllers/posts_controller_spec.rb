require 'spec_helper'

describe PostsController do
  describe 'GET #index' do
    it 'responds successfully with an HTTP 200 status code' do
      get :index
      expect(response).to be_success
      expect(response.status).to eq(200)
    end

    it 'renders the index template' do
      get :index
      expect(response).to render_template('index')
    end
  end

  describe 'GET #new' do
    it 'does respond successfully with an HTTP status code' do
      get :new
      expect(response).to be_success
      expect(response.status).to eq(200)
    end
  end

  describe 'GET #show' do
    it 'does show post' do
      post = Post.create(title: 'The title', text: 'The content')

      get :show, id: post.id
      expect(response).to be_success
      expect(response.status).to eq(200)
    end
  end

  describe 'GET #edit' do
    it 'does edit params' do
      post = Post.create(title: 'The title', text: 'The content')

      get :edit, id: post.id
      expect(response).to be_success
    end

    it 'renders edit action' do
      post = Post.create(title: 'The title', text: 'The content')

      get :edit, id: post.id
      expect(response).to render_template(:edit)
    end
  end

  describe 'PATCH #update' do
    it 'does update params' do
      post = Post.create(title: 'The title', text: 'The content')

      patch :update, id: post.id, post: {
                                        title: 'The title',
                                        text: 'The content' }

      expect(response).to redirect_to "/posts/#{post.id}"
    end

    it 'renders edit if text is missing' do
      post = Post.create(title: 'The title', text: 'The Content')

      patch :update, id: post.id

      expect(response).to render_template(:edit)
    end
  end

  describe 'POST #create' do
    it 'does create new post' do
      post = Post.create(title: 'The title', text: 'The content')

      get :create, id: post.id, post: {
                                      title: 'The title',
                                      text: 'The content' }
    end

    it 'renders new if text is missing' do
      post = Post.create(title: 'The title', text: 'The Content')

      get :create, id: post.id, post: {
                                      title: '' }

      expect(response).to render_template(:new)
    end
  end

  describe 'DELETE #destroy' do
    it 'does delete posts' do
      post = Post.create(title: 'The title', text: 'The Content')

      delete :destroy, id: post.id, post: {
                                          title: 'The title',
                                          text: 'The content' }
       expect(response).to redirect_to '/posts'
    end
  end
end
