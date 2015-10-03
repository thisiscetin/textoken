require 'yaml'

require 'textoken/version'
require 'textoken/base'
require 'textoken/errors'
require 'textoken/searcher'
require 'textoken/options'
require 'textoken/findings'
require 'textoken/tokenizer'
require 'textoken/scanner'

require 'textoken/options/less_than'
require 'textoken/options/more_than'
require 'textoken/options/only'
require 'textoken/options/exclude'

require 'textoken/factories/option_factory'

# Textoken is a library for customizable tokenization of texts.
# Customizable tokenization can be used in many areas including NLP purposes
module Textoken
  GEM_ROOT = File.expand_path('../..', __FILE__)

  class << self
    # Expression error raised in wrong user input of options & values
    def expression_err(msg)
      fail ExpressionError, msg
    end

    # Type error raised when user input format is right but the option value
    # is not suitable for option
    def type_err(msg)
      fail TypeError, msg
    end
  end
end

# A shortcut to initialize gem
# Textoken('I had rather be first in a village than second at Rome.')
def Textoken(text, options = nil)
  Textoken::Base.new(text, options)
end
