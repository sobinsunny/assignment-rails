class Prize < ApplicationRecord
  scope :available_items, -> { where('stock_count > 0 ') }

  validates :name, presence: true
  validates :stock_count, presence: true, numericality: true
  belongs_to :condition

  def reduce_count
    self.stock_count -= 1
    save
  end
end
