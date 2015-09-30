module Textoken
  # This class duty is to collect splitted words with array index no
  # And also handles making uniq of multiple words in the same index
  # due to Regexps that reveal same/closer results
  class Findings
    def initialize
      @collection = []
    end

    # Here we will push items to collection array with index number
    # index number will help us to sort and make array unique
    def push(index, word)
      type_check(index, word)
      @collection << [index, word]
    end

    # collection will return a sorted and unique array of tokens
    def collection
      @collection.uniq(&:first).sort_by(&:first)
    end

    private

    def type_check(index, word)
      return if word.is_a?(String) && index.is_a?(Fixnum)
      Textoken.type_err("#{word} and #{index} has to be a String and Integer")
    end
  end
end
