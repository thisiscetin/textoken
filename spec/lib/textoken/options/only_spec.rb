require 'spec_helper'

# only.tokenize(base) - base will be the mock
# object should be initialized with a value or Regexp

describe Textoken::Only do
  describe '#initialize' do
    context 'when value is a Regexp' do
      it 'does not raise en error' do
      end

      it 'stores regexp by initializing with Regexp class in an array' do
      end
    end

    context 'when value is a reserved keyword from yml' do
      it 'does not raise an error' do
      end

      it 'does store Regexps in an array' do
      end
    end

    context 'when value is not an expected object' do
      it 'raises a TypeError' do
      end
    end
  end

  describe '#tokenize' do
    context 'when class_in_argument.text is an empty array' do
      it 'does not raise an error' do
      end

      it 'does push nothing to findings' do
      end
    end

    context 'when class_in_argument has expected structure' do
      it 'tokenize with a singular value from yml file' do
      end

      it 'tokenize with many values from yml file' do
      end

      it 'tokenize with a regexp' do
      end
    end
  end
end
