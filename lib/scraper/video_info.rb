module Scraper
  class VideoInfo
    attr_accessor :supplier, :image_urls, :iframe, :url, :title

    def initialize(url)
      doc  = Converter.execute(url)

      @url        = url
      @title      = doc.title
      @image_urls = []

      case url
      when /\Ahttps*:\/\/(www\.|)youtube\.com\/.+\z/
        youtube_scrape(url, doc)
      else
        nil
      end
    end

    def youtube_scrape(url,doc)
      youtube_src = url.split("watch?v=").last
      youtube_src.gsub!("&", "?")
      @iframe =  '<iframe width="560" height="315" src="//www.youtube.com/embed/' + youtube_src + '" frameborder="0" allowfullscreen></iframe>'
      @image_urls << "http://img.youtube.com/vi/#{youtube_src}/mqdefault.jpg"
      @supplier = 'You Tube'
    end

  end
end