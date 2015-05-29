require 'rspec'
require 'testrailconnection'
require 'videosearch'
require 'tcinfo'

#we should ad a reporter here
  RSpec.configure do |config|
    config.warnings = false
    config.expect_with :rspec do |c|
      c.syntax = [:should, :expect]
      end
  end

  @@status = nil
  
  RSpec.describe "Search Video" do
      subject {vid}
      
      before (:context) do
      info = TCInfo.new.tc_info('1266')
      puts 'Test Case Title: ' << info["title"] 
      puts "Searching for video..."
      @video = VideoSearch.new('https://www.youtube.com', 'Guidespark', 'GuideSparkddcfsdvfvfv').video_found  #(youtube url, Video name for search, Video title name)
      puts "Video found?: #{@video}"
      end 

      context "video exists" do
       let(:vid) {@video== true ? @@status = :Passed : @@status = :Failed}
       specify {expect(subject).to eq(:Passed)}
      end
    
      after (:context) do 
      puts 'Reporting status to TestRail'
      puts "TestRail Status: #{@@status}"
      report = TestRailConnection::TestRailAPI.new
      report.set_status(@@status, '124', '1266')
      end
  end
