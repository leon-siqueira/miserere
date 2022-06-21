# frozen_string_literal: true

# == Schema Information
#
# Table name: confession_queues
#
#  id         :bigint           not null, primary key
#  city       :string           default(""), not null
#  date       :date
#  end_time   :datetime
#  latitude   :float
#  longitude  :float
#  notes      :text
#  place      :string
#  postcode   :string           default(""), not null
#  start_time :datetime
#  state      :string           default(""), not null
#  street     :string           default(""), not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class ConfessionQueue < ApplicationRecord
  has_many :schedulings

  validates :place, presence: true
  validates_date :date, on_or_after: Date.current,
                        on_or_after_message: "A data deve ser depois de #{Date.current}"
  validates_datetime :start_time, after: DateTime.current,
                                  after_message: "A hora de ínicio deve ser depois de #{Time.current}"
  validates_datetime :end_time, after: :start_time,
                                after_message: 'A hora de témino deve ser depois da hora de início'

  geocoded_by :address
  after_validation :geocode, if: :address_changed?

  def address
    [street, city, postcode, state].compact.join(', ')
  end

  def address_changed?
    street_changed? || city_changed? || postcode_changed? || state_changed?
  end
end
