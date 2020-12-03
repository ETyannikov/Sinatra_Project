class Doctor < ActiveRecord::Base 
  belongs_to :user
  has_many :patient
  has_many :vaccine
end