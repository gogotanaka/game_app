# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
urls = [
         "https://www.youtube.com/watch?v=r8OipmKFDeM",
         "https://www.youtube.com/watch?v=6hzrDeceEKc",
         "https://www.youtube.com/watch?v=JUoVQ-kB7DQ",
         "https://www.youtube.com/watch?v=KoVHC0s_sZs",
         "https://www.youtube.com/watch?v=izITCnFEpp4",
         "https://www.youtube.com/watch?v=r8OipmKFDeM",
         "https://www.youtube.com/watch?v=6hzrDeceEKc",
         "https://www.youtube.com/watch?v=JUoVQ-kB7DQ",
         "https://www.youtube.com/watch?v=KoVHC0s_sZs",
         "https://www.youtube.com/watch?v=izITCnFEpp4"
       ]

urls.each do |url|
  service = Scraper::Service.new([url])
  video_infos = service.execute.first
  video = Video.create(user_id: 1, title: video_infos.title, contents: "いいね！！！！！")
  movie = Movie.create(url: video_infos.url, iframe: video_infos.iframe, image_url: video_infos.image_urls.first, video_id: video.id)
end