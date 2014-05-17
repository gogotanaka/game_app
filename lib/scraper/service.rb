module Scraper
  class Service
    attr_accessor :urls

    def initialize(urls)
      @urls = urls
    end

    def execute
      @urls.map{ |url| VideoInfo.new(url) }
    end
  end
end