require 'spec_helper'

# exclude.tokenize(base) - base will be the mock
# object should be initialized with a value representing a key in YML file

describe Textoken::Exclude do
  include_context 'base mock'
  it_behaves_like 'regexp dependent option'
  it_behaves_like 'module sharing option', 'dates'

  describe '#tokenize' do
    context 'when class_in_argument.text is an empty array' do
      it 'does not raise an error & push nothing to findings' do
        init_mocks
        expect do
          Textoken::Exclude.new('dates').tokenize(base)
        end.to_not raise_error
      end
    end

    context 'when class_in_argument has expected structure' do
      it 'tokenize with a singular value from yml file' do
        init_mocks(%w(Alfonso 444-555-1234 246.555.8888),
                   [[0, 'Alfonso']])
        Textoken::Exclude.new('phones').tokenize(base)
      end

      it 'tokenize with many values from yml file' do
        init_mocks(%w(10 100.0 Alfa 5,700), [[2, 'Alfa']])
        Textoken::Exclude.new('numerics').tokenize(base)
      end
    end
  end
end
