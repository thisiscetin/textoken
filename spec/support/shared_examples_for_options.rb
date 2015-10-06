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

RSpec.shared_examples 'module sharing option' do |value|
  describe '#tokenize' do
    context 'setting base when called' do
      it 'does set the base' do
        o = described_class.new(value)
        o.tokenize(base)
        expect(o.base).to eq(base)
      end
    end
  end
end
