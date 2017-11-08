#!/usr/bin/env ruby

require 'optparse'


module Ldappwd
  class Optionparser

    def self.parse(arguments, defaults = { })
      options = defaults

      OptionParser.new do |opts|
        opts.banner = "Usage: ldappwd"

        opts.on("-S", "--secret PLAINTEXT", "The secret to convert into a LDAP password") do |secret|
          options[:secret] = secret
        end

        opts.on("-s", "--salt [SALT]", "The salt of your passwords") do |salt|
          options[:salt] = salt
        end

        opts.on_tail("-h", "--help", "Show this message") do
          puts opts
          exit
        end
      end.parse!(arguments)

      raise ::OptionParser::MissingArgument.new('The secret argument is mandatory') if options[:secret].nil?

      options
    end
  end
end

