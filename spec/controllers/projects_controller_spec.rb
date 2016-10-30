require "rails_helper"

RSpec.describe ProjectsController, type: :controller do
  describe "Standard CRUD" do
    let(:instance_project) { assigns(:project) }
    let(:base_project) { create(:project) }
    let(:static_project) { create(:project, name: "spec-project") }
    let(:valid_attributes) { attributes_for(:project, name: "spec-project") }
    let(:invalid_attributes) { attributes_for(:project, name: nil) }

    describe "GET #index" do
      it "populates an array of all @projects" do
        second_project = create :project
        get :index
        expect(assigns(:projects)).to match_array([base_project, second_project])
      end
    end

    describe "GET show" do
      it "assigns the requested project as @project" do
        get :show, params: { id: base_project }
        expect(instance_project).to eq(base_project)
      end
    end

    describe "GET new" do
      it "assigns a new project as @project" do
        get :new
        expect(instance_project).to be_a_new(Project)
      end
    end

    describe "GET edit" do
      it "assigns the requested project as @project" do
        get :edit, params: { id: base_project }
        expect(instance_project).to eq(base_project)
      end
    end

    describe "POST create" do
      describe "with valid params" do
        it "creates a new Project" do
          expect do
            post :create, params: { project: valid_attributes }
          end.to change(Project, :count).by(1)
        end

        it "assigns a newly created project as @project" do
          post :create, params: { project: valid_attributes }
          expect(instance_project).to be_a(Project)
          expect(instance_project).to be_persisted
        end

        it "redirects to the created project" do
          post :create, params: { project: valid_attributes }
          expect(response).to redirect_to(Project.last)
        end
      end

      describe "with invalid params" do
        it "assigns a newly created but unsaved project as @project" do
          post :create, params: { project: invalid_attributes }
          expect(instance_project).to be_a_new(Project)
        end

        it "re-renders the 'new' template" do
          post :create, params: { project: invalid_attributes }
          expect(response).to render_template("new")
        end
      end
    end

    describe "PUT update" do
      describe "with valid params" do
        it "assigns the requested project as @project" do
          put :update, params: { id: static_project, project: valid_attributes }
          static_project.reload
          expect(instance_project).to eq(static_project)
        end

        it "redirects to the project" do
          put :update, params: { id: static_project, project: valid_attributes }
          expect(response).to redirect_to(static_project)
        end
      end

      describe "with invalid params" do
        it "assigns the project as @project" do
          put :update, params: { id: static_project, project: invalid_attributes }
          expect(assigns(:project)).to eq(static_project)
        end

        it "re-renders the 'edit' template" do
          put :update, params: { id: static_project, project: invalid_attributes }
          expect(response).to render_template("edit")
        end
      end
    end

    describe "DELETE destroy" do
      it "destroys the requested project" do
        new_project = create :project
        expect do
          delete :destroy, params: { id: new_project }
        end.to change(Project, :count).by(-1)
      end

      it "redirects to the project list" do
        delete :destroy, params: { id: base_project }
        expect(response).to redirect_to(projects_url)
      end
    end
  end
end
