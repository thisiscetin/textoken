module Textoken
  # This is the default tokenizer when no options are given
  # aim of this class is to tokenize text with seperation of punctuation marks
  # also Exclude, Only and many comming classes inherit this class
  class Default
    attr_reader :text, :values

    def initialize(text, values = nil)
      @text   = text
      @values = values.split(',').map(&:strip) if values
    end

    def tokens
      punctuation_marks.each do |p|
        @text = @text.gsub(p, ' ' + p + ' ')
      end
      text.split(' ')
    end

    private

    def punctuation_marks
      ['.', '?', '!', ':', ';', '-', '_', '(',
       ')', '[', ']', '...', '\"', '/', ',', '\'']
    end
  end
end
