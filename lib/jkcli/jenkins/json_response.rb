module Jkcli
  module Jenkins
    class JsonResponse
      
      def initialize(response)
        @response = response
      end

      def json
        @json ||= JSON.parse(@response.body)
      end

      def code
        @response.code
      end

    end
  end
end
