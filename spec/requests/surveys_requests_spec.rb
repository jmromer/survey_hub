# frozen_string_literal: true

require "rails_helper"

RSpec.describe "Surveys", type: :request do
  describe "GET #index" do
    it "responds with 200 and the list of surveys" do
      surveys = create_list(:survey, 3)

      get "/surveys"

      expect(response).to have_http_status(:ok)
      surveys.each do |survey|
        expect(response.body).to include(survey.question_text)
      end
    end
  end

  describe "GET #show" do
    it "responds with 200 and the requested surveys" do
      survey = create(:survey)

      get "/surveys/#{survey.id}"

      expect(response).to have_http_status(:ok)
      expect(response.body).to include(survey.question_text)
    end
  end
end
