class VideoInfo
  class UrlError < StandardError; end

  PROVIDERS = %w[
    YouTube
  ].freeze

  extend Forwardable

  def_delegators :@provider, :provider, :url, :video_id, :data, :formatted_data

  def initialize(url)
    @provider = select_provider(url)
  end

  private

  def select_provider(url)
    provider_const = providers_const.detect { |p| p.usable?(url) }

    raise UrlError, "Url is not usable by any Providers: #{url}" if provider_const.blank?

    provider_const.new(url)
  end

  def providers_const
    PROVIDERS.map { |p| VideoInfo.const_get(p) }
  end
end
