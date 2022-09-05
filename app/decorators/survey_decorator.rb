# frozen_string_literal: true

class SurveyDecorator < ApplicationDecorator
  delegate_all
  decorates_association :question

  def results
    [[question.text, question.results]]
  end
end
