# frozen_string_literal: true

class ResponsesController < ApplicationController
  def create
    responses = Survey.find(params[:survey_id]).question.responses

    question_response =
      responses
        .find_by(respondent_id: current_user.id)
        .tap { _1&.assign_attributes(response_params) } ||
      responses
        .new(response_params.merge(respondent_id: current_user.id))

    flash_message =
      if question_response.save
        { notice: t(:response_created) }
      else
        { alert: t(:response_not_created) }
      end

    redirect_to surveys_path, flash_message
  end

  private

  def response_params
    params.require(:response).permit(:response_option_id)
  end
end
