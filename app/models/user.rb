class User < ActiveRecord::Base 
  has_secure_password
  has_many :patient
  has_many :vaccine
  
end