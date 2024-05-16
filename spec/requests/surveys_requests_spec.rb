# frozen_string_literal: true

require "rails_helper"

RSpec.describe "Surveys", type: :request do
  describe "GET #index" do
    it "responds with 200 and the list of surveys" do
      surveys = create_list(:survey, 3)

      get "/surveys"

      expect(response).to have_http_status(:ok)
      surveys.each do |survey|
        expect(response.body).to include(survey.question.text)
      end
    end
  end

  describe "GET #show" do
    it "responds with 200 and the requested surveys" do
      survey = create(:survey)
      get "/surveys/#{survey.id}"
      expect(response).to have_http_status(:ok)
      expect(response.body).to include(survey.question.text)
    end

    it "responds with 200 and the requested surveys" do
      get "/surveys/3848"
      expect(flash.alert).to be_present
      expect(response).to redirect_to(surveys_path)
    end
  end

  describe "GET #new" do
    it "responds with 200" do
      get "/surveys/new"
      expect(response).to have_http_status(:ok)
    end
  end

  describe "POST #create" do
    it "renders a success message on success" do
      question_params = attributes_for(:question)

      post "/surveys", params: { question: question_params }

      expect(flash.notice).to be_present
      expect(flash.alert).to be_blank
      expect(response).to redirect_to(surveys_path)
    end

    it "renders an error message on failure" do
      question_params = attributes_for(:question, text: "")

      post "/surveys", params: { question: question_params }

      expect(flash.notice).to be_blank
      expect(flash.alert).to be_present
      expect(response).to redirect_to(surveys_path)
    end
  end
end
