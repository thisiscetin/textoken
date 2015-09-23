require 'textoken/version'
require 'textoken/base'
require 'textoken/errors'
require 'textoken/combinator'
require 'textoken/tokenizers/default'
require 'textoken/tokenizers/only'
require 'textoken/tokenizers/exclude'

# ff
module Textoken
end

def Textoken(text, options = nil)
  Textoken::Base.new(text, options)
end
