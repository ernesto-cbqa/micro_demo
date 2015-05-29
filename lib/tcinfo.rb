require_relative 'testrail'
require 'json'

class TCInfo 
  def initialize
    @testrailapi = TestRail::APIClient.new('https://knodemy.testrail.com')
 	@testrailapi.user = 'israel@knodemy.com'
    @testrailapi.password = 'knodemyqa1!'    
  end

  def tc_info (case_id)
 	
 	info = @testrailapi.send_get('get_case/' + case_id)
 	#return info
 	
  end
end
