require 'open-uri'

class VideoInfo::Provider
  attr_accessor :url, :iframe_attributes, :video_id
  attr_writer :data

  def initialize(url)
    @url = url
    fetch_video_id_from_url
  end

  def data
    @data ||= fetch_data_from_api
  end

  def fetch_data_from_api(url_of_api = api_url)
    uri = URI.parse(url_of_api).open
    JSON.parse(uri.read)
  end

  def fetch_video_id_from_url
    @video_id = @url.match(self.class.url_regex)[1]
    unless valid_video_id?
      raise UrlError, "Url is not valid, video_id is not found: #{url}"
    end
  end

  def valid_video_id?
    video_id && video_id != url && !video_id.empty?
  end

  private

  def api_url
    raise NotImplementedError.new(
      'Provider class must implement #api_url private method'
    )
  end

  class << self
    def usable?(_url)
      raise NotImplementedError.new(
        'Provider class must implement #usable? public method'
      )
    end

    def url_regex
      raise NotImplementedError.new(
        'Provider class must implement #url_regex private method'
      )
    end
  end
end
