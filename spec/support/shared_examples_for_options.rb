RSpec.shared_examples "an option" do |values|
  subject { described_class.new(values) }

  it 'should be inherited from option' do
    expect(described_class).to be < Textoken::Option
  end

  it { should respond_to(:priority) }
  it { should respond_to(:tokenize) }
  it { should respond_to(:post_initialize) }
end

RSpec.shared_examples "a numeric option" do
  it 'should be initializable with an integer' do
    validate_numericality_without_error(3)
  end

  it 'should raise errors in initialization for non-integers' do
    validate_numericality_with_error('1, 2')
  end

  it 'should raise error when value integer = 0' do
    validate_numericality_with_error(0)
  end

  it 'should raise error when value integer is negative' do
    validate_numericality_with_error(-1)
  end

  def validate_numericality_with_error(value)
    init_numericality(value).to raise_error(Textoken::TypeError)
  end

  def validate_numericality_without_error(value)
    init_numericality(value).to_not raise_error
  end

  def init_numericality(value)
    expect do
      Textoken::LessThan.new(value)
    end
  end
end