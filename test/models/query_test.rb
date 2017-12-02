require 'test_helper'

class QueryTest < ActiveSupport::TestCase

   test "should execute the retrieven query" do

     mock_client = Minitest::Mock.new
     def mock_client.search(params); [ {docId: 1} ]; end

     query = Query.find(1)
     hits  = query.run({ "q" => "Igualada" }, mock_client)
     assert hits.count > 0
   end
end
