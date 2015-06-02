#This is a library to stablish connection between testrail API and our code
require_relative 'testrail'
require 'json'

module TestRailConnection
    class TestRailAPI
      def initialize 
        @testrailapi = TestRail::APIClient.new('https://cbqademos.testrail.net')
        @testrailapi.user = 'ernesto@cbqasolutions.com'
        @testrailapi.password = 'CBQAsolutions1!'         
      end

      def set_status (status, test_run, test_id)
        statusid = {:Passed => 1, :Blocked => 2, :Untested => 3, :Retest => 4, :Failed => 5}   #each elements contains its respective 
        data = {:status_id => statusid[status]}
        json_data = JSON.generate (data)  
        return output = @testrailapi.send_post("add_result_for_case/" + test_run +'/'+ test_id ,JSON.parse(json_data))  
      end

      def tc_info (case_id)
        info = @testrailapi.send_get('get_case/' + case_id)
        #return info
      end
    end
end
