module Textoken
  # camelize input
  # create option if option is avaliable
  module OptionFactory
    def self.build(key, value)
      option_klass(key).new(value)
    end

    private

    def self.camelize(key)
      key.to_s.split('_').map(&:capitalize).join
    end

    def self.option_klass(key)
      Textoken.const_get(camelize(key).to_sym)
    rescue NameError
      Textoken.expression_error("#{key}: is not a valid option.")
    end
  end
end
