#!/usr/bin/env ruby

require 'digest'
require 'base64'
require 'ldappwd/option_parser'
require 'ldappwd/generators'

module Ldappwd
  class CLI

   def self.run(arguments)
     parameters = Optionparser.parse(arguments, { salt: Generators::DEFAULT_SALT })
     puts Generators.ssha(parameters[:secret], parameters[:salt])
   end
  end
end

