require_relative 'testrail'
require 'json'

module TestRailConnection

    class TestRailAPI
    
     
      def initialize 
                
      end

      def set_status (status, test_run, test_id)
        statusid = {:Passed => 1, :Blocked => 2, :Untested => 3, :Retest => 4, :Failed => 5}   #each elements contains its respective 
        data = {:status_id => statusid[status]}
        json_data = JSON.generate (data)  

        testrailapi = TestRail::APIClient.new('https://knodemy.testrail.com')
        testrailapi.user = 'israel@knodemy.com'
        testrailapi.password = 'knodemyqa1!'
        puts output = testrailapi.send_post("add_result_for_case/" + test_run +'/'+ test_id ,JSON.parse(json_data))  
      end
    end
end
