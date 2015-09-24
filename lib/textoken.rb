require 'yaml'

require 'textoken/version'
require 'textoken/base'
require 'textoken/errors'
require 'textoken/combinator'
require 'textoken/searchable'
require 'textoken/tokenizers/default'
require 'textoken/tokenizers/only'
require 'textoken/tokenizers/exclude'

# ff
module Textoken
  def self.expression_error(msg)
    fail ExpressionError, msg
  end

  def self.intersection(arrays)
    Combinator.new(arrays).intersection
  end
end

def Textoken(text, options = nil)
  Textoken::Base.new(text, options)
end
