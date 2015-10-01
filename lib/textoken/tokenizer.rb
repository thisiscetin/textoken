require 'pry'

module Textoken
  # This is the last step in the process
  # Takes findings objects and makes finishing punctuation split
  # Does not split if base.dont_split is true
  # reuses findings object to split words
  class Tokenizer
    attr_reader :base, :findings

    def initialize(base)
      @base     = base
      @findings = Findings.new
    end

    def tokens
      return base.findings.collection if base.dont_split
      split_punctuations
      findings.result
    end

    private

    def split_punctuations
      base.findings.collection.each do |word, index|
        PunctuationSplitter.new(word, index).result.each do |r|
          findings.push(r[0], r[1])
        end
      end
    end

    # def split_punctuations
    #   base.findings.collection.each_with_index do |t, i|
    #     add_to_collection(t[1], i)
    #   end
    # end

    # def add_to_collection(word, index)
    #   puts word.partition(default_regexp).inspect

    # end

    # # creates a new index number by adding new word length divided by 10
    # # that will help findings to sort in right order
    # def new_index(index, i)
    #   (index.to_s + '.' + i.to_s).to_f
    # end

    # # will be used for finding punctuations
    # def default_regexp
    #   Regexp.new('\W+')
    # end

  end
end
