RSpec.shared_context 'base mock' do
  let(:base)      { double('option') }
  let(:findings)  { double('findings') }

  def init_mocks(text_arr = [], expectations = [])
    allow(base).to receive(:text).and_return(text_arr)
    allow(base).to receive(:findings).and_return(findings)
    init_finding(expectations)
  end

  def init_finding(expectations)
    expectations.each do |ex|
      allow(findings).to receive(:push).with(ex[0], ex[1])
    end
  end
end
