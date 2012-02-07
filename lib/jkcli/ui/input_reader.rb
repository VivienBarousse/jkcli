module Jkcli
  module Ui
    class InputReader

      class << self

        def read_string(prompt, default)
          print "#{prompt} [#{default}]: "
          value = STDIN.gets.strip!
          value = default if value.empty?
          value
        end

        def read_choice(prompt, choices)
          index = 1
          choices.each do |choice|
            puts "#{index}: #{choice}"
            index += 1
          end

          choice = 0
          while choice < 1 || choice > choices.length
            print "#{prompt} [1]: "
            read = STDIN.gets.strip!
            choice = read.to_i rescue 0
            choice = 1 if read.empty?
          end
          choices[choice - 1]
        end

        def read_password(prompt, default)
          begin
            system "stty -echo"
            password = read_string(prompt, default)
            puts
          ensure
            system "stty echo"
          end
          password
        end

        def read_boolean(prompt, default)
          str = read_string(prompt, default.to_s)
          if str == "true"
            true
          elsif str == "false"
            false
          else
            read_boolean(prompt, default)
          end
        end

      end

    end
  end
end
