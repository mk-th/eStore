class Account < ActiveRecord::Base
	has_many :journals

	def self.import(file)
		CSV.foreach(file.path, headers: true) do |row|
		    Account.create! row.to_hash
		end
	end
end
