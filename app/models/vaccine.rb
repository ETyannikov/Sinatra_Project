class Vaccine < ActiveRecord::Base 
  belongs_to_many :doctor
  belongs_to_many :patient
end