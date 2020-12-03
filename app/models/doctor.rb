class Doctor < ActiveRecord::Base 
  has_many :patient
  has_many :vaccine
end