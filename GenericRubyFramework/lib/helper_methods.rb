module HelperMethods
  
  def post_to_test_rail(status, testrun_id, testcase_id)
    report = TestRailConnection::TestRailAPI.new
    report.set_status(status, testrun_id, testcase_id)
  end
  
end
