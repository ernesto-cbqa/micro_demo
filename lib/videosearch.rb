require 'watir-webdriver'

class VideoSearch
  
  @@video = nil
	def initialize (url='https://www.youtube.com',video_search, video_title)
	  browser = Watir::Browser.new :firefox
    browser.goto url
    browser.text_field(:id => 'masthead-search-term').set video_search
    browser.button(:id => 'search-btn').click
    v = browser.link(:title => video_title)

    if v.exists?
      v.click
      @@video = true
    else
      @@video = false
    end      

    browser.close
  end

	def video_found 
		video_found = @@video
	end
end
