class Company < ActiveRecord::Base
	acts_as_paranoid
	has_many :investment_rounds
end
