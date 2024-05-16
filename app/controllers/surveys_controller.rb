# frozen_string_literal: true

class SurveysController < ApplicationController
  def index
    @surveys =
      Survey
        .includes(question: :response_options)
        .order(id: :desc)
        .all
        .decorate
  end

  def show
    @survey = Survey.find_by(id: params[:id])&.decorate
    return render :show if @survey.present?

    redirect_to surveys_path, alert: t(:survey_not_found)
  end

  def new
    @survey = Survey.new(creator: current_user)
  end

  def create
    Survey.transaction do
      survey = Survey.create!(creator: current_user)
      Question.create!(question_params.merge(survey:))
    end
    redirect_to surveys_path, notice: t(:survey_created)
  rescue ActiveRecord::RecordInvalid
    redirect_to surveys_path, alert: t(:survey_not_created)
  end

  private

  def question_params
    params.require(:question).permit(:text, :description)
  end
end
