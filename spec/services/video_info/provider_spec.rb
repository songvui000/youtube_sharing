RSpec.describe VideoInfo::Provider do
  let(:url) { 'url' }
  let(:provider) { VideoInfo::Provider.new(url) }

  describe 'initialize' do
    it 'should raise error if url_regex is not implement' do
      error_msg = 'Provider class must implement #url_regex private method'
      expected = expect { VideoInfo::Provider.new(url) }
      expected.to raise_error(NotImplementedError, error_msg)
    end
  end

  describe '.usable?' do
    it 'should raise eror if not usable' do
      error_msg = 'Provider class must implement #usable? public method'
      expected = expect do
        VideoInfo::Provider.usable?('url')
      end
      expected.to raise_error(NotImplementedError, error_msg)
    end
  end
end
