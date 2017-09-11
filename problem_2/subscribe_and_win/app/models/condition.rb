class Condition < ApplicationRecord
  has_many :prizes

  def self.get_applicable_prizes(subscriber)
    prizes = []
    Condition.all.each do |condition|
      rule = condition.decision_params['rule']
      prizes << if rule == '='
                  condition.prizes.available_items if condition.check_equal?(subscriber)
                elsif rule == '%'
                  condition.prizes.available_items if condition.check_multiple?(subscriber)
                elsif rule == '<'
                  condition.prizes.available_items if condition.check_grater_than?(subscriber)
                elsif rule == '>'
                  condition.prizes.available_items if condition.check_less_than?(subscriber)
          end
    end
    prizes.flatten.compact
  end

  def check_equal?(subscriber)
    decision_params['value'].include?(subscriber.id)
  end

  def check_multipile?(subscriber)
    (subscriber.id % decision_params['value']).zero?
  end

  def check_grater_than?(subscriber)
    subscriber.id > decision_params['value']
  end

  def check_less_than?(subscriber)
    subscriber.id < decision_params['value']
  end
end
