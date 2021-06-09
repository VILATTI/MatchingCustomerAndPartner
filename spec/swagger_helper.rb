RSpec.configure do |config|
  config.swagger_root = Rails.root.join('swagger').to_s

  config.swagger_docs = {
    'v1/swagger.yaml' => {
      swagger: '2.0',
      info: {
        title: 'API External',
        version: 'v1'
      },
      paths: {},
      securityDefinitions: {
        apiKey: {
          type: :apiKey,
          name: 'Authorization',
          in: :header
        }
      }
    }
  }

  config.swagger_format = :yaml
end
