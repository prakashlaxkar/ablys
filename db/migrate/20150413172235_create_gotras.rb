class CreateGotras < ActiveRecord::Migration
  def change
    create_table :gotras do |t|
      t.string :name

      t.timestamps
    end

	["Pawar", "Badela", "Badwar", "Bagadi", "Baksariya", "Bhagat", "Bhardwaj", "Bhati", "Bilha", "Chandel", "Chandrma", 
	"Chodhariya", "Chouhan", "Devda", "Dhalyiya", "Gaharwal", "God", "Gudalya", "Handa", "Hanumanta", "Hatadiya", 
	"Himmatpuri", "Jaisangpura", "Jaylok", "Jhilmiliya", "Jogela", "Kamdhaj", "Karediya", "Kashyap", "Mahatele",
	"Mahobia", "Makwana", "Mandaretya", "Mandariya", "Mandhata", "Motiya", "Mudree", "Nagoriya", "Nainvaya", "Nalwariya",
	"Narwaan", "Panihar", "Panwar", "Parihar", "Rathod", "Ratnela", "Sambhariya", "Sarangpura", "Shandilya", "Solanki", 
	"Songra", "Tahariya", "Tentwal", "Tilgatiya", "Vadhys", "Vashist", "Vyas", "Kachhawa", "Kaithuniya"].each { |x| Gotra.create(name: x) }
  end
end
