module RoutingHelper
  def route2geojson(route)
    linestrs = []
    route.each{|r| linestrs <<  r.wkt.delete("MULTILINESTRING(").delete("(").delete(")").split(",") }
    arr_of_points = linestrs.flatten.map!{|v| v.split(" ").map{|v| v.to_f }}
    {"type"=>"FeatureCollection",  "features"=> [  { "type"=>"Feature",  "id"=>"OpenLayers.Feature.Vector_509",  
      "properties"=>{ "title"=>"Feature 2",  "strokeColor"=>"red",  "author"=>"Your Name Here" },  
      "geometry"=>{ "type"=>"LineString",  "coordinates"=>arr_of_points } } ] }      
  end
end
