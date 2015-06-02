class VideoSearch
  include PageObject
  
  page_url 'https://www.youtube.com'
  
  text_field(:search_field, id: 'masthead-search-term')
  button(:search, id: 'search-btn')
  
  def video_link(video_title)
    browser.link(title: video_title)
  end
  
  def get_video_by_title(video_search, expected_video_title)
    self.search_field = video_search
    search
    
    video_link = video_link(expected_video_title)
    return video_link if video_link.exists? 
  end
 
	
end
