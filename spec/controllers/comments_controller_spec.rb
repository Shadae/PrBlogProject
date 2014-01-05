require 'spec_helper'

describe CommentsController do
  describe 'GET #create' do
    it 'does create new comment' do
      post = Post.create(title: 'The title', text: 'The content')

      get :create, post_id: post.id, comment: {
                                              body: 'The content',
                                              commenter: 'name' }
    end
  end

  describe 'DELETE #destroy' do
    it 'does delete comments' do
      post = Post.create( title: 'The title', text: 'The Content')
      comment = Comment.create( body: 'The content', commenter: 'name', post_id: post.id )

      delete :destroy, post_id: post.id, id: comment.id

      expect(response).to redirect_to "/posts/#{post.id}"
    end
  end
end
