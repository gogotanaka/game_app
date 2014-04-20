require 'open-uri'
require 'kconv'

module Scraper
  module Converter
    def execute(url)
      begin
        html = open(url).read
      #日本語urlだった場合
      rescue URI::InvalidURIError
        url = URI.encode(url)
        html = open(url, "Accept-Encoding" => "utf-8")
      rescue OpenURI::HTTPError
        error = true
      #ネット切れてる
      rescue Errno::ENOENT
        error = true
      rescue Zlib::DataError
        html = open(url, "Accept-Encoding" => "utf-8")
      end
      doc = Nokogiri::HTML(html, url)
    end

    module_function :execute
  end
end