require 'jkcli/jenkins/json_http_client'

module Jkcli
  module Jenkins
    class JenkinsClient < JsonHttpClient
      
      def initialize(server, opts = {})
        super(server)
      end

      def jobs
        jobs = get '/api/json'
        jobs["jobs"] || []
      end

      def views
        jobs = get '/api/json'
        jobs["views"] || []
      end

      def build(job, opts={})
        puts "Launching job " + job
      end

    end
  end
end
