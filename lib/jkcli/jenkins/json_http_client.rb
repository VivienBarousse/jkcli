require 'rest-client'
require 'json'

module Jkcli
  module Jenkins
    class JsonHttpClient

      def initialize(base_url)
        @base_url = base_url
      end

      def get(path, params = {})
        res = RestClient.get(@base_url + path, params)
        JSON.parse(res.body)
      end

    end
  end
end
