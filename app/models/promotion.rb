class Promotion < ApplicationRecord
  belongs_to :game
  validates :title, :description, :start_date, :end_date, presence: true
  validate :end_date_is_after_start_date

  private
  def end_date_is_after_start_date
    return if end_date.blank? || start_date.blank?

    if end_date < start_date
      errors.add(:end_date, "deve ser maior que a data inicial.")
    end
  end

end
