#!/usr/bin/env ruby

require 'digest'
require 'base64'
require 'ldappwd/option_parser'

module Ldappwd
  class CLI

   DEFAULT_SALT = 'I@mth3M@st3r0fth3P1@n'

   def self.generate_password(secret, salt=DEFAULT_SALT, options={ })
    options.merge!(salt: DEFAULT_SALT)
    "{SSHA}#{Base64.encode64(Digest::SHA1.digest("#{secret}#{salt}")+salt).chomp}"
   end

   def self.run(arguments)
     parameters = Ldappwd::Optionparser.parse(arguments)
     $stderr.puts parameters.inspect
     CLI.generate_password(parameters[:secret])
   end
  end
end

