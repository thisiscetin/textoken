module Textoken
  # ff
  class Default
    attr_reader :text, :values

    def initialize(object, values = nil)
      @text   = object.text
      @values = values
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
       ')', '[', ']', '...', "\\'", '/', ',']
    end
  end
end
