require 'yaml'

require 'textoken/version'
require 'textoken/base'
require 'textoken/errors'
require 'textoken/searchable'
require 'textoken/options'

require 'textoken/options/option'
require 'textoken/options/less_than'
require 'textoken/options/more_than'
require 'textoken/options/only'
require 'textoken/options/exclude'
require 'textoken/options/split'

require 'textoken/factories/option_factory'

# xx
module Textoken
  def self.expression_error(msg)
    fail ExpressionError, msg
  end
end

# a shortcut to initialize gem
def Textoken(text, options = nil)
  Textoken::Base.new(text, options)
end
