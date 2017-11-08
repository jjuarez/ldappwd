require 'base64'
require 'digest'

module Ldappwd
  class Generators
   DEFAULT_SALT = 'I@mth3M@st3r0fth3P1@n'

   def self.ssha(secret, salt)
    "{SSHA}#{Base64.encode64(Digest::SHA1.digest("#{secret}#{salt}")+salt).chomp}"
   end
  end
end

