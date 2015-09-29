module Textoken
  # This class duty is to collect splitted words with array index no
  # And also handles making uniq of multiple words in the same index
  # due to Regexps that reveal same/closer results
  class Findings
    def initialize
      @collection = []
    end

    def push(word, index)
      @collection << [index, word]
    end

    # maybe needed for exclude
    # def pop(word, index)
    # end

    def collection
      @collection.uniq(&:first)
    end
  end
end
