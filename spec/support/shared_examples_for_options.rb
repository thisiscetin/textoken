RSpec.shared_examples 'regexp dependent option' do
  describe '#initialize' do
    context 'when value is a reserved keyword from yml' do
      it 'does not raise an error' do
        expect do
          described_class.new('phones')
        end.to_not raise_error
      end

      it 'does store Regexps in an array' do
        t = described_class.new('punctuations')
        expect(t.regexps).to eq([Regexp.new('\W+')])
      end
    end

    context 'when value is not String object' do
      it 'raises a TypeError' do
        expect do
          described_class.new(Object)
        end.to raise_error(Textoken::ExpressionError)
      end
    end
  end
end
