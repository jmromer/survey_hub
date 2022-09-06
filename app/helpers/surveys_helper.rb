# frozen_string_literal: true

module SurveysHelper
  # rubocop:disable Metrics/MethodLength
  def response_button(response_option)
    already_selected =
      response_option.respondents.where(id: current_user.id).any?

    classes = %w[
      inline-block
      text-center
      rounded-md
      border
      border-gray-300
      px-6
      py-3
      text-base
      font-medium
      shadow-sm
      focus:outline-none
      focus:ring-2
      focus:ring-indigo-500
      focus:ring-offset-2
      w-32
    ].then do |list|
      if already_selected
        list.concat(%w[bg-gray-700 text-white hover:bg-white-80])
      else
        list.concat(%w[bg-white text-gray-700 hover:bg-gray-50])
      end
    end

    button_tag response_option.value, disabled: already_selected, class: classes
  end
  # rubocop:enable Metrics/MethodLength
end
