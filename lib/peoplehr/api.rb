require "json"
require "typhoeus/adapters/faraday"

module PeopleHR
  class API
    API_ROOT = Addressable::URI.parse("https://api.peoplehr.net/")

    class APIError < StandardError; end
    class BadResponse < APIError; end

    def initialize(api_key:, connection: nil)
      @api_key = api_key
      @connection = connection ||
        Faraday.new(url: API_ROOT) do |faraday|
          faraday.request :url_encoded
          faraday.adapter :typhoeus
        end
    end

    def request(endpoint, action, params = {})
      request = {
        "APIKey" => api_key,
        "Action" => action,
      }

      payload = params.merge(request)
      payload = JSON.generate(payload)

      response = connection.post do |req|
        req.url "/#{endpoint}"
        req.headers["Content-Type"] = "application/json"
        req.body = payload
      end

      data = JSON.parse(response.body)

      if !data || data["isError"]
        fail APIError
      end

      data
    rescue JSON::ParserError
      fail BadResponse.new("Bad JSON returned by the API:\n\n#{response.body}")
    end

    private

    attr_reader :connection, :api_key
  end
end
