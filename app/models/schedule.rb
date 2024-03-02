class Schedule < ApplicationRecord
  validates :title, presence: true, length: {maximum: 20}
  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :memo, length: {maximum: 500}
  validate :select_date?

  def select_date?
    errors.add(:end_date, "は開始日以降のものを選択してください") if start_date > end_date
  end
end
