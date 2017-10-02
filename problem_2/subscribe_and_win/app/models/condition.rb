class Condition < ApplicationRecord
  has_many :prizes

  def self.get_applicable_prizes(subscriber)
    prizes = []
    @subscriber = subscriber
    Condition.all.each do |condition|
      rule = condition.decision_params['rule']
      prizes << if rule == '='
                  condition.prizes.available_items if condition.check_equal?
                elsif rule == '%'
                  condition.prizes.available_items if condition.check_multiple?
                elsif rule == '<'
                  condition.prizes.available_items if condition.check_grater_than?
                elsif rule == '>'
                  condition.prizes.available_items if condition.check_less_than?
                end
          end
    prizes.flatten.compact
  end

  def check_equal?
    decision_params['value'].to_i == @subscriber.id
  end

  def check_multiple?
    (@subscriber.id % decision_params["value"].to_i).zero?
  end

  def check_grater_than?
    @subscriber.id > decision_params["value"].to_i
  end

  def check_less_than?
    @subscriber.id < decision_params["value"].to_i
  end

end
