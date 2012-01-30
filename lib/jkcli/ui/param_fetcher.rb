require 'jkcli/ui/input_reader'

module Jkcli
  module Ui
    class ParamFetcher
      class << self

        def fetcher(param_def)
          case param_def["type"]
            when "StringParameterDefinition"
              StringParamFetcher.new(param_def)
            when "ChoiceParameterDefinition"
              ChoiceParamFetcher.new(param_def)
            when "PasswordParameterDefinition"
              PasswordParamFetcher.new(param_def)
          else
            raise "Unknown parameter type"
          end
        end

      end

      def default_value
        @def["defaultParameterValue"]["value"]
      end

      def name
        @def["name"]
      end

    end

    class StringParamFetcher < ParamFetcher

      def initialize(param_def)
        @def = param_def
      end

      def fetch
        InputReader.read_string(name, default_value)
      end

    end

    class ChoiceParamFetcher < ParamFetcher
      
      def initialize(param_def)
        @def = param_def
      end

      def fetch
        InputReader.read_choice(name, choices)
      end

      def choices
        @def["choices"]
      end

    end

    class PasswordParamFetcher < ParamFetcher

      def initialize(param_def)
        @def = param_def
      end

      def fetch
        InputReader.read_password(name, default_value)
      end

    end
  end
end
