#!/usr/bin/env ruby

require 'optparse'


module Ldappwd
  class Optionparser

    def self.parse(arguments, defaults = { })
      options = defaults
      parser  = OptionParser.new do |opts|
        opts.banner = "Usage: ldappwd"

        opts.on("-S", "--secret PLAINTEXT", String, "The secret to convert into a LDAP password") do |s|
          options[:secret] = s
        end

        opts.on("-s", "--salt [SALT]", String, "The salt of your passwords") do |s|
          options[:salt] = s
        end

        opts.on("-f", "--format PLAIN|LDIFF|JSON|YAML", String, [:plain, :ldiff, :json, :yaml], "The output format of the command") do |f|
          options[:format] = f
        end

        opts.on_tail("-h", "--help", "Show this message") do
          puts opts
          exit
        end
      end

      parser.parse!
      raise ::OptionParser::MissingArgument.new('The secret argument is mandatory') if options[:secret].nil?

      options
    end
  end
end

