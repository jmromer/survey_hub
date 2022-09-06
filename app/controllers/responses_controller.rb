# frozen_string_literal: true

class ResponsesController < ApplicationController
  def create
    question = Survey.find(params[:survey_id]).question

    flash_message =
      if question.record_response(respondent: current_user, response_option:)
        { notice: t(:response_created) }
      else
        { alert: t(:response_not_created) }
      end

    redirect_to surveys_path, flash_message
  end

  private

  def response_option
    param = params.require(:response).permit(:response_option_id)
    ResponseOption.find_by(id: param[:response_option_id])
  end
end
