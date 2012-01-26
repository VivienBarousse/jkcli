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
      
      def job(job_name)
        res = get "/job/#{job_name}/api/json"
        res.json
      end

      def views
        res = get '/api/json'
        res.json["views"] || []
      end

      def build(job_name, options={})
          url = "/job/#{job_name}/build"
          url += "WithParameters" if options[:parameters] && options[:parameters].any?
          post(url, options[:parameters] || {})
        rescue RestClient::Found
      end

    end
  end
end
