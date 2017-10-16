class FlatBookingsController < ApplicationController
  def home

  end
	def get_report
    @results = []
    @start_date = DateTime.parse(params["flat_booking"]["start_date(1i)"] + "-" + params["flat_booking"]["start_date(2i)"] + "-" + params["flat_booking"]["start_date(3i)"])
    @end_date = DateTime.parse(params["flat_booking"]["end_date(1i)"] + "-" + params["flat_booking"]["end_date(2i)"] + "-" + params["flat_booking"]["end_date(3i)"])
    
    flats = FlatBooking.where("date_of_booking < ? AND date_of_booking >= ?", @end_date, @start_date)
    
    if params["flat_booking"]["report_type"] == "monthly_sales"
      flats.group_by {|e| e.date_of_booking.strftime('%Y-%b')}
    .each{|k,v| @results << {"#{k}" => v.inject(0){|sum,x| sum + (x.agreement_amount + (x.area * x.base_price))} }}
    else
      flats.group_by {|e| e.date_of_booking.strftime('%Y')}
    .each{|k,v| @results << {"#{k}" => v.inject(0){|sum,x| sum + (x.agreement_amount + (x.area * x.base_price))} }}
    end
    redirect_to action: 'show_data', results: @results
  end

  def show_data
    @results = params[:results]
  end
end
