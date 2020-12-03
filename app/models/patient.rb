class Patient < ActiveRecord::Base 
  belongs_to :doctor
  has_many :vaccine
end