tori = Patient.create( :user_id => 1, :full_name => "Tori Miller", :age => 16)
royan = User.create( :username => "JuneBug11", :password => "password")
plzer = Vaccine.create(:name => "plzer", :disease => "COVID19", :time => "12/20/2020", :patient_id => 1, :user_id => 1)

