module Textoken
  # This factory created option objects throug user input option
  # User input option like 'more_than: 3' (more_than) gets camelized
  # and objects get initialized with error handling
  module OptionFactory
    def self.build(key, value)
      option_klass(key).new(value)
    end

    private

    def self.camelize(key)
      key.to_s.split('_').map(&:capitalize).join
    end

    def self.option_klass(key)
      # add a module to make other classes unaccessible
      Textoken.const_get(camelize(key).to_sym)
    rescue NameError
      Textoken.expression_err("#{key}: is not a valid option.")
    end
  end
end
