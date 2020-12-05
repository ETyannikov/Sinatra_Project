tori = User.create(:username => "PineapplePrincess736", :full_name => "Tori Miller", :password_digest => "password", :is_doctor => false)
royan = User.create(:username => "JuneBug11", :full_name => "Royan Tyannikov", :password_digest => "password", :is_doctor => true)
Doctor.create(:user_id => royan.id)
Patient.create(:user_id => tori.id, :age => 18, :gender => "female", :doctor_id => royan.id)
