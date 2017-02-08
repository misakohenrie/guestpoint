require 'rails_helper'

describe EmployeesController do

  before do
    @unit = Unit.create!(unit_attributes)
    @employee = @unit.employees.create!(employee_attributes)
  end

  context "when not signed in" do

    before do
      session[:employee_id] = nil
    end

    it "cannot access index" do
      get :index, params: { unit_id: @unit }

      expect(response).to redirect_to(signin_url)
    end

    it "cannot access show" do
      get :show, params: { id: @employee }

      expect(response).to redirect_to(signin_url)
    end

    it "cannot access edit" do
      get :edit, params: { id: @employee }

      expect(response).to redirect_to(signin_url)
    end

    it "cannot access update" do
      patch :update, params: { id: @employee }

      expect(response).to redirect_to(signin_url)
    end

    it "cannot access destroy" do
      delete :destroy, params: { id: @employee }

      expect(response).to redirect_to(signin_url)
    end

  end


   context "when not signed in as an admin" do

    before do
      non_admin = @unit.employees.create!(employee_attributes(first_name:"Other",
                                                              email: "other@example.com",
                                                              admin: false))
      session[:employee_id] = non_admin.id
    end

    it "cannot access the index of employees" do
      get :index, params: { unit_id: @unit }

      expect(response).to redirect_to(signin_url)
    end

    it "cannot access new" do
      get :new, params: { unit_id: @unit }

      expect(response).to redirect_to(signin_url)
    end

    it "cannot access create" do
      post :create, params: { unit_id: @unit }

      expect(response).to redirect_to(signin_url)
    end

    it "cannot access destroy" do
      delete :destroy, params: { id: @employee }

      expect(response).to redirect_to(signin_url)
    end
  end

end