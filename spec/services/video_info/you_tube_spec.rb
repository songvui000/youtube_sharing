RSpec.describe VideoInfo::YouTube do
  let(:api_key) { 'youtube_api_key_123'}
  describe '.usable?' do
    subject { VideoInfo::YouTube.usable?(url) }

    context 'with youtube.com url' do
      let(:url) { 'https://www.youtube.com/watch?v=lEFvcZCRGUo' }
      it { is_expected.to be_truthy }
    end

    context 'with youtu.be url' do
      let(:url) { 'https://youtu.be/lEFvcZCRGUo' }
      it { is_expected.to be_truthy }
    end

    context 'with other url' do
      let(:url) { 'http://google.com/video1' }
      it { is_expected.to be_falsey }
    end
  end

  context 'with video lEFvcZCRGUo' do
    subject { VideoInfo.new('https://www.youtube.com/watch?v=lEFvcZCRGUo') }

    describe '#provider' do
      subject { super().provider }
      it { is_expected.to eq 'YouTube' }
    end

    describe '#video_id' do
      subject { super().video_id }
      it { is_expected.to eq 'lEFvcZCRGUo' }
    end

    describe '#url' do
      subject { super().url }
      it { is_expected.to eq 'https://www.youtube.com/watch?v=lEFvcZCRGUo' }
    end
  end
end