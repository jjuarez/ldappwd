#!/usr/bin/env ruby

require 'digest'
require 'base64'
require 'ldappwd/option_parser'
require 'ldappwd/generators'
require 'ldappwd/formater'

module Ldappwd
  class CLI

    DEFAULT_ERROR_CODE = 1

    def self.run(arguments)
      parameters = Optionparser.parse(arguments, { salt: Generators::DEFAULT_SALT, format: :plain })
      secret     = Generators.ssha(parameters[:secret], parameters[:salt])

      Formater.new.send("#{parameters[:format]}", secret)
    rescue StandardError => e
      $stderr.puts "ERROR: #{e.message}"
      exit DEFAULT_ERROR_CODE
    end
  end
end

