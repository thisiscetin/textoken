require 'yaml'

require 'textoken/version'
require 'textoken/base'
require 'textoken/errors'
require 'textoken/searchable'
require 'textoken/options'

require 'textoken/options/modules/numeric_option'
require 'textoken/options/modules/conditional_option'

require 'textoken/options/option'
require 'textoken/options/less_than'
require 'textoken/options/more_than'
require 'textoken/options/only'
require 'textoken/options/exclude'
require 'textoken/options/split'

require 'textoken/factories/option_factory'

# Textoken is a library for customizable tokenization of texts.
# Customizable tokenization can be used in many areas including NLP purposes
module Textoken
  GEM_ROOT = File.expand_path("../..", __FILE__)
  # Expression error raised in wrong user input of options & values
  def self.expression_err(msg)
    fail ExpressionError, msg
  end

  # Inheritence error used mostly in options inheritence of option
  def self.inheritence_err(msg)
    fail InheritenceError, msg
  end

  # Type error raised when user input format is right but the option value
  # is not suitable for option
  def self.type_err(msg)
    fail TypeError, msg
  end
end

# A shortcut to initialize gem
# Textoken('I had rather be first in a village than second at Rome.')
# Textoken('I had rather be...', split: 'dates, numbers', more_than: 3)
def Textoken(text, options = nil)
  Textoken::Base.new(text, options)
end
