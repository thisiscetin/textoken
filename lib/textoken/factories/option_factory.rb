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
      Object.const_get(klass_name(key))
    rescue NameError
      Textoken.expression_error("#{key}: is not a valid option.")
    end

    def self.klass_name(key)
      name = camelize(key)
      RUBY_VERSION < "2.0.0" ? name.to_sym : 'Textoken::' + name
    end
  end
end
