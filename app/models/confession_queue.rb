class ConfessionQueue < ApplicationRecord
  has_many :schedulings

  validates :place, presence: true
  validates_date :date, on_or_after: Date.current,
                        on_or_after_message: "A data deve ser depois de #{Date.current}"
  validates_time :start_time, after: Time.current,
                                  after_message: "A hora de ínicio deve ser depois de #{Time.current}"
  validates_time :end_time, after: :start_time,
                                after_message: "A hora de témino deve ser depois da hora de início"
end
