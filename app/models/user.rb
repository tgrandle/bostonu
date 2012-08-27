class User < ActiveRecord::Base
  attr_accessible :first_name, :graduation_year, :last_name, :email
  has_one :Qr
end
