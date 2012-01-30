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

      end

    end
  end
end
