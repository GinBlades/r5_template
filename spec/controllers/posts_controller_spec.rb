require "rails_helper"

RSpec.describe PostsController, type: :controller do
  describe "Standard CRUD" do
    let(:instance_post) { assigns(:post) }
    let(:base_post) { create(:post) }
    let(:static_post) { create(:post, name: "spec-post") }
    let(:valid_attributes) { attributes_for(:post, name: "spec-post") }
    let(:invalid_attributes) { attributes_for(:post, name: nil) }

    describe "GET #index" do
      it "populates an array of all @posts" do
        second_post = create :post
        get :index
        expect(assigns(:posts)).to match_array([base_post, second_post])
      end
    end

    describe "GET show" do
      it "assigns the requested post as @post" do
        get :show, params: { id: base_post }
        expect(instance_post).to eq(base_post)
      end
    end

    describe "GET new" do
      it "assigns a new post as @post" do
        get :new
        expect(instance_post).to be_a_new(Post)
      end
    end

    describe "GET edit" do
      it "assigns the requested post as @post" do
        get :edit, params: { id: base_post }
        expect(instance_post).to eq(base_post)
      end
    end

    describe "POST create" do
      describe "with valid params" do
        it "creates a new Post" do
          expect do
            post :create, params: { post: valid_attributes }
          end.to change(Post, :count).by(1)
        end

        it "assigns a newly created post as @post" do
          post :create, params: { post: valid_attributes }
          expect(instance_post).to be_a(Post)
          expect(instance_post).to be_persisted
        end

        it "redirects to the created post" do
          post :create, params: { post: valid_attributes }
          expect(response).to redirect_to(Post.last)
        end
      end

      describe "with invalid params" do
        it "assigns a newly created but unsaved post as @post" do
          post :create, params: { post: invalid_attributes }
          expect(instance_post).to be_a_new(Post)
        end

        it "re-renders the 'new' template" do
          post :create, params: { post: invalid_attributes }
          expect(response).to render_template("new")
        end
      end
    end

    describe "PUT update" do
      describe "with valid params" do
        it "assigns the requested post as @post" do
          put :update, params: { id: static_post, post: valid_attributes }
          static_post.reload
          expect(instance_post).to eq(static_post)
        end

        it "redirects to the post" do
          put :update, params: { id: static_post, post: valid_attributes }
          expect(response).to redirect_to(static_post)
        end
      end

      describe "with invalid params" do
        it "assigns the post as @post" do
          put :update, params: { id: static_post, post: invalid_attributes }
          expect(assigns(:post)).to eq(static_post)
        end

        it "re-renders the 'edit' template" do
          put :update, params: { id: static_post, post: invalid_attributes }
          expect(response).to render_template("edit")
        end
      end
    end

    describe "DELETE destroy" do
      it "destroys the requested post" do
        new_post = create :post
        expect do
          delete :destroy, params: { id: new_post }
        end.to change(Post, :count).by(-1)
      end

      it "redirects to the post list" do
        delete :destroy, params: { id: base_post }
        expect(response).to redirect_to(posts_url)
      end
    end
  end
end
