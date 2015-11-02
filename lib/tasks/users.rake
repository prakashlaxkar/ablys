namespace :users do

  desc "Load users data"
  task :load => :environment do
    require 'csv'
    csv_file = Rails.root.join("db/lakhara.csv")
    skipped_header = false
    CSV.foreach(csv_file) do |fields|
      if skipped_header
        u = User.new
        u.serial_number = fields[0].to_i
        u.name = fields[1]
        u.username = fields[1].split(" ").first + fields[14][7..9]
        u.f_name = fields[2]
        u.gender = fields[3]
        u.gotra = fields[4]
        u.marital_status = fields[5]
        u.is_matrimony = true if fields[5] == 'Single'
        u.membership = fields[6]
        u.qualification = fields[7]
        u.designation = fields[8]
        u.pin_code = fields[9] || "111111"
        u.address = fields[10]
        u.city = fields[11]
        u.state = fields[12]
        u.dob = fields[13]
        u.phone = fields[14]
        u.country = "India"
        u.password = "123456789"
        if File.exists?("./db/ablys/#{fields[0].to_i}.jpg")
            f =  File.open("./db/ablys/#{fields[0].to_i}.jpg")
            u.avatar = f
            f.close
        end
        u.save(validate: false)
        puts "User created for #{u.serial_number} ====================="
        p u
      else
        skipped_header = true
      end
    end
  end
end
