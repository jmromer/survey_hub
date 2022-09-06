# frozen_string_literal: true

Rails.application.config.session_store :cookie_store,
                                       key: "_survey_hub",
                                       expire_after: 14.days
