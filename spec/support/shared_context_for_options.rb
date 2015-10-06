RSpec.shared_context 'base mock' do
  let(:base)      { double('base', options: options, text: []) }
  let(:options)   { double('options', collection: []) }
  let(:findings)  { double('findings') }

  def init_mocks(text_arr = [])
    allow(base).to receive(:text).and_return(text_arr)
    allow(base).to receive(:findings).and_return(findings)
  end
end
