require 'test_helper'

class FlatBookingsControllerTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end

  test "should get root" do
	  get '/'
	  assert_response :success
	end

  test "show monthly sales data" do
    hash_parameter = { "flat_booking" => { "start_date(1i)" => "2016",
                                         "start_date(2i)" => "2",
                                         "start_date(3i)" => "5", 
                                         "end_date(1i)" => "2017",
                                         "end_date(2i)" => "5",
                                         "end_date(3i)" => "15",
                                         "report_type" => "monthly_sales"} 
                       }
  	post '/flat_bookings/get_report', hash_parameter
  	assert_response :redirect
  end

  test "show yearly sales data" do
    hash_parameter = { "flat_booking" => { "start_date(1i)" => "2016",
                                         "start_date(2i)" => "2",
                                         "start_date(3i)" => "5", 
                                         "end_date(1i)" => "2017",
                                         "end_date(2i)" => "4",
                                         "end_date(3i)" => "15",
                                         "report_type" => "yearly_sales"} 
                       }
  	post '/flat_bookings/get_report', hash_parameter
  	assert_response :redirect
  end

end
