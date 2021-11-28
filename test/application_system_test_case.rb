require "test_helper"

Capybara.register_driver :selenium_chrome do |app|
  options = Selenium::WebDriver::Chrome::Options.new
  %w[headless window-size=1440x1080 disable-gpu no-sandbox disable-dev-shm-usage lang=ja-JP].each do |arg|
    options.add_argument(arg)
  end

  Capybara::Selenium::Driver.new(app, browser: :chrome, capabilities: options)
end

class ApplicationSystemTestCase < ActionDispatch::SystemTestCase
  driven_by(:selenium_chrome)
end