require 'jkcli/jenkins/json_http_client'

module Jkcli
  module Jenkins
    class JenkinsClient < JsonHttpClient
      
      def initialize(server, opts = {})
        super(server)
      end

      def jobs
        res = get '/api/json'
        res.json["jobs"] || []
      end

      def views
        res = get '/api/json'
        res.json["views"] || []
      end

      def build(job_name)
        get "/job/#{job_name}/build"
      end

    end
  end
end
