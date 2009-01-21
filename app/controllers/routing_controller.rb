class RoutingController < ApplicationController
  def route
    require "pp"
    pp params
    # {"action"=>"route",
    # "method"=>"SPD",
    # "controller"=>"routing",
    # "startpoint"=>"34.34249714294434 31.38743437072754",
    # "finalpoint"=>"34.34120968261719 31.382112868041993"}
    method  		= params["method"]
    start_x, start_y 	= params["startpoint"].split(" ")
    end_x, end_y 	= params["finalpoint"].split(" ")
    @route = Way.find_route(method, start_x.to_f, start_y.to_f, end_x.to_f, end_y.to_f)
    respond_to do |wants|
      wants.json {  }
    end
  end
end
