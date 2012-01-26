require 'rest-client'
require 'json'

require 'jkcli/jenkins/json_response'

module Jkcli
  module Jenkins
    class JsonHttpClient

      def initialize(base_url)
        @base_url = base_url
      end

      def get(path, params = {})
        res = RestClient.get(@base_url + path, params)
        JsonResponse.new(res)
      end

      def post(path, params = {})
        res = RestClient.post(@base_url + path, params)
        JsonResponse.new(res)
      end

    end
  end
end
