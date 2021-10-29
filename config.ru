require_relative "app"
run Rack::Handler.default.run(App, :Port => 3000)
