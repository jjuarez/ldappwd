module Ldappwd
  class Formater
    def initialize
      self
    end

    def plain(secret, options={ })
      secret
    end

    def json(secret, options={ password_attribute: 'user_password '})
      "{\n  \"#{options[:password_attribute]}\": \"#{secret}\"\n}"
    end

    def ldiff(secret, options={ password_attribute: 'userPassword' })
<<-LDIFF
dn: $DN
changetype: modify
replace: #{options[:password_attribute]}
#{options[:password_attribute]}: #{secret}

LDIFF
    end

    def yaml(secret, options= { password_attribute: 'user_password' })
      "---\n  #{options[:password_attribute]}: '#{secret}'\n"
    end

    def method_missing(m, *args, &block)
      raise StandardError.new('Unknown format')
    end
  end
end

