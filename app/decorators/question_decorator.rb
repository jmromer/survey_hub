# frozen_string_literal: true

class QuestionDecorator < ApplicationDecorator
  delegate_all

  def results
    counts = response_options.pluck(:value, :responses_count)
    total = counts.sum(&:second)
    counts.map do |response, count|
      percentage = total.zero? ? 0 : (count * 100 / total).round(2)
      [response, count, percentage]
    end
  end
end
