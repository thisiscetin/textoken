module Textoken
  # xx
  class Seperate < Option
    def priority
      1
    end

    def post_initialize
      super
      validate_length
    end

    def tokenize(text_arr)
      regexps.each do |r|
        text_arr = match_and_update(text_arr, Regexp.new(r))
      end
      text_arr
    end

    private

    def match_and_update(t, regexp)
      t.each_with_index do |w, i|
        matching = w.index(regexp)
        t = replace_word(t, i, push_and_split(w, matching)) if matching
      end
    end

    def push_and_split(word, index)
      word.insert(index, ' ').split(' ')
    end

    def replace_word(text, i, new_words)
      text.delete_at(i)
      new_words.reverse_each { |w| text.insert(i, w) }
      text
    end

    def validate_length
      return if values.split(',').length == 1
      fail TypeError, 'seperate option can only have one value.'
    end
  end
end
