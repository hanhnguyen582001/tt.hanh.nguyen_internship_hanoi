# Load the Rails application.
require_relative 'application'

# Initialize the Rails application.
I18n.load_path += Dir[Rails.root.join('config', 'locales', '**', '*.{rb,yml}')]
I18n.default_locale = :vi
I18n.available_locales = %i[en vi]
Rails.application.initialize!
