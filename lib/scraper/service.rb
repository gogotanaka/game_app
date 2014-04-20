module Scraper
  # サービス指向アーキテクチャ
  # http://ja.wikipedia.org/wiki/%E3%82%B5%E3%83%BC%E3%83%93%E3%82%B9%E6%8C%87%E5%90%91%E3%82%A2%E3%83%BC%E3%82%AD%E3%83%86%E3%82%AF%E3%83%81%E3%83%A3

  attr_accessor :urls
  class Service
    def initialize(urls)
      @urls = urls
    end

    def execute
      @urls.map{ |url| VideoData.new(url) }
    end
  end
end