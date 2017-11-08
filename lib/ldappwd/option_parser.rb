#!/usr/bin/env ruby

require 'optparse'


module Ldappwd
  class Optionparser

    def self.parse(arguments)
      options = { }

      OptionParser.new do |opts|
        opts.banner = "Usage: #{$0}"

        opts.on("-s", "--secret PLAINTEXT", "The secret to convert into a LDAP password") do |s|
          options[:secret] = s
        end

        opts.on_tail("-h", "--help", "Show this message") do
          puts opts
          exit
        end
      end.parse!(arguments)

      options
    end
  end
end

