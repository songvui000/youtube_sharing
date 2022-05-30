class VideoInfo::YouTube < VideoInfo::Provider
  def formatted_data
    item = data['items'][0]
    {
      id: item['id'],
      video_type: provider,
      title: item['snippet']['title'],
      description: item['snippet']['description']
    }
  end

  def provider
    'YouTube'
  end

  private

  def api_key
    Rails.application.credentials.google_key_api
  end

  def api_base
    'www.googleapis.com'
  end

  def api_path
    "/youtube/v3/videos?id=#{video_id}" \
    '&part=snippet,statistics,status,contentDetails&fields=' \
    "items(id,snippet,statistics,status,contentDetails)&key=#{api_key}"
  end

  def api_url
    "https://#{api_base}#{api_path}"
  end

  class << self
    def usable?(url)
      url =~ url_regex
    end

    def url_regex
      %r{^(?:(?:https?:)?\/\/)?(?:(?:www|m)\.)?(?:(?:youtube\.com|youtu.be))(?:\/(?:[\w\-]+\?v=|embed\/|v\/)?)([\w\-]+)(?:\S+)?$}x
    end
  end
end
