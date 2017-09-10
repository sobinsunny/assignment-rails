class Subscriber < ApplicationRecord
	 validates :email, uniqueness: { scope: :created_at, message: "should subscribe one per day" }

end
