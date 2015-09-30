require 'spec_helper'

module TestDumy
  class Dumy
    attr_reader :findings

    def initialize
      @findings = Findings.new
    new
  end

  class Findings
    def initialize
    end

    def collection
      [[1, 'Alfa'], [5, 'beta\'s'], [6, 'teta?'], [7, 'omega !'], [9, 'psi.']]
    end
  end
end

describe Textoken::Tokenizer, focus: true do
end
