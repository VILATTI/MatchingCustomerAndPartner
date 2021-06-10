module TestHelpers
  module Requests
    def responses_json
      JSON.parse(response.body, symbolize_names: true)
    end

    def requests_rswag_example(*)
      self.class.metadata[:response][:examples] = { 'application/json' => responses_json }
    end
  end
end

RSpec.configure do |config|
  config.include TestHelpers::Requests, type: :controller
  config.include TestHelpers::Requests, type: :request
end
