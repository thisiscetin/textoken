require 'spec_helper'

module TestDumy
  # dumy class to mock findings
  class Dumy
    attr_reader :findings

    def initialize
      @findings = Findings.new
    end
  end

  # many punctuation types to be tested
  class Findings
    def collection
      [[1, 'Alfa'], [5, 'beta\'s'], [6, 'teta?'], [7, 'omega !'], [9, 'psi.']]
    end
  end
end

describe Textoken::Tokenizer, focus: true do
end
