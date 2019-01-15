class Author < ActiveRecord::Base

validates :name, prescence: true

validates :name, uniqueness: true

validates :phone_number , length: {minimum: 10}


end
