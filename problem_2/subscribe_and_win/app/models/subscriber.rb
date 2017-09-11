class Subscriber < ApplicationRecord

	validates :email, presence: true
	validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
	validates_uniqueness_of :email, scope: :created_on, message: "You're already subscribed! for this day"

	def select_prizes
		applicable_prize = Condition.get_applicable_prizes(self)
	    @prize_list.each(&:reduce_count)
	end

end
