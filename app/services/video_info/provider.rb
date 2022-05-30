require 'open-uri'
require 'net/http'


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
  rescue OpenURI::HTTPError => e
    if e.instance_of?(OpenURI::HTTPError) &&
       e.respond_to?(:io) &&
       e.io.respond_to?(:status)
      response_code = e.io.status[0]
      if response_code == '400'
        log_warn('your API key is probably invalid. Please verify it.')
      end
    end

    msg = 'unexpected network error while
          fetching information about the video'
    raise StandardError, msg
  end

  def fetch_video_id_from_url
    @video_id = @url.match(url_regex)[1]
    unless valid_video_id?
      raise UrlError, "Url is not valid, video_id is not found: #{url}"
    end
  end

  def valid_video_id?
    video_id && video_id != url && !video_id.empty?
  end
end
