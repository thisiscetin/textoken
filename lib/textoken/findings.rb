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
      @collection.uniq { |w| w[0].to_s + w[1] }.sort_by(&:first)
    end

    # result will return a one dimensional array of words
    def result
      collection.map(&:last)
    end

    private

    def type_check(i, word)
      return if word.is_a?(String) && (i.is_a?(IntClass) || i.is_a?(Float))
      Textoken.type_err("#{word} and #{i} has to be a String and Integer")
    end
  end
end
