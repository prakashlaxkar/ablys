class UpdatesCitiesRecordsToCities < ActiveRecord::Migration[5.2]
  def change
  	array = [{"cities" => ["Jaipur","Jodhpur","Alwar","Nagaur","Udaipur","Sikar","Barmer","Ajmer","Bharatpur","Bhilwara","Bikaner","Jhunjhunun","Churu","Pali","Ganganagar","Kota","Jalor","Banswara","Hanumangarh","Dausa","Chittaurgarh","Karauli","Tonk","Jhalawar","Dungarpur","Sawai Madhopur","Baran","Dhaulpur","Rajsamand","Bundi","Sirohi","Pratapgarh","Jaisalmer"], "state" => "Rajasthan"},
  	{"cities" => ["Ahmedabad", "Surat", "Vadodara", "Rajkot", "Bhavnagar", "Jamnagar", "Gandhinagar", "Mahesana", "Morbi", "Surendranagar", "Gandhidham", "Veraval", "Navsari", "Bharuch", "Anand", "Porbandar", "Godhra","Botad", "Sidhpur"], "state" => "Gujarat"}]
  	array.each do |hash|
  		hash["cities"].each do |city|
  			City.create(name: city, state: hash["state"])
  		end
  	end
  end
end












