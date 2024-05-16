# frozen_string_literal: true

# For the test environment, in-memory caching is enabled by default
# (see: config/environments/test.rb).
#
# Individual spec examples can be provided a `cache: [cache type]` metadata tag
# to enable the given cache for the given example.
#
# Valid values for cache types are `:memory`, `:file`, and `:redis_cache`.
# To override and disable, use `cache: :null`.
RSpec.configure do |config|
  config.around(:each, :cache) do |example|
    Rails.cache.tap do |original|
      cache_type = example.metadata[:cache]
      args = ["#{cache_type}_store".to_sym]
      args << Rails.root.join("tmp/cache.test") if cache_type == :file

      Rails.cache = ActiveSupport::Cache.lookup_store(*args.compact)
      example.run
      Rails.cache = original
    end
  end
end
