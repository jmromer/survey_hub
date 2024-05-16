# frozen_string_literal: true

require "rails_helper"

RSpec.describe "Responses", type: :request do
  describe "POST #create" do
    it "responds with 204 and persists the response if successful" do
      user = create(:user)
      survey = create(:survey)
      response_option = survey.question.response_options.first
      responses = Response.count

      post "/surveys/#{survey.id}/responses", params: {
        response: {
          respondent_id: user.id,
          response_option_id: response_option.id,
        },
      }

      expect(flash[:alert]).to be_blank
      expect(response).to redirect_to(surveys_path)
      expect(Response.count).to eq(responses + 1)
    end

    it "responds with 422 and does not persist the response if unsuccessful" do
      survey = create(:survey)
      responses = Response.count

      post "/surveys/#{survey.id}/responses", params: {
        response: {
          respondent_id: 300,
          response_option_id: 383,
        },
      }

      expect(flash[:alert]).to be_present
      expect(response).to redirect_to(surveys_path)
      expect(Response.count).to eq(responses)
    end
  end
end
