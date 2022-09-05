# frozen_string_literal: true

# Bullet configuration
Rails.application.configure do
  config.after_initialize do
    if Rails.env.test?
      Bullet.enable = true
      Bullet.bullet_logger = true
      Bullet.raise = true
    elsif Rails.env.development?
      Bullet.enable = true # enable Bullet gem, otherwise do nothing
      Bullet.console = true # log warnings to your browser's console.log (Safari/Webkit browsers)
      Bullet.bullet_logger = true # log to the Bullet log file (Rails.root/log/bullet.log)
      Bullet.rails_logger = true # add warnings directly to the Rails log
      Bullet.alert = false # pop up a JavaScript alert in the browser
      Bullet.xmpp = false # send XMPP/Jabber notifications to the receiver indicated.
      Bullet.raise = false # raise errors, useful for making your specs fail unless they have optimized queries

      # adds the details in the bottom left corner of the page. Double click the
      # footer or use close button to hide footer.
      Bullet.add_footer = false

      # prevents Bullet from injecting code into the returned HTML. This must be
      # false for receiving alerts, showing the footer or console logging
      Bullet.skip_html_injection = false

      Bullet.stacktrace_includes = []

      # ignore paths with any of these substrings in the stack trace, even if they
      # are not in your main app. Each item can be a string (match substring), a
      # regex, or an array where the first item is a path to match, and the second
      # item is a line number, a Range of line numbers, or a (bare) method name,
      # to exclude only particular lines in a file.
      Bullet.stacktrace_excludes = [".bundle"]

      # Bullet.slack = {
      #   webhook_url: 'http://some.slack.url',
      #   channel: '#default',
      #   username: 'notifier'
      # }

      # Exception tracking services
      Bullet.sentry = false
      Bullet.honeybadger = false
      Bullet.bugsnag = false
      Bullet.appsignal = false
      Bullet.airbrake = false
      Bullet.rollbar = false

      # Detectors: Each of these settings defaults to true
      Bullet.n_plus_one_query_enable = true # Detect N+1 queries
      Bullet.unused_eager_loading_enable = true # Detect eager-loaded associations which are not used
      Bullet.counter_cache_enable = true # Detect unnecessary COUNT queries which could be avoided with a counter_cache
    end
  end
end
