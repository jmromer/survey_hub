# frozen_string_literal: true

RSpec.configure do |config|
  config.around(:each, bullet: :skip) do |example|
    Bullet.enable = false
    example.run
    Bullet.enable = true
  end
end
