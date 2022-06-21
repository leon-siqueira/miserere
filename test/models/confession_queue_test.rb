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
require 'test_helper'

class ConfessionQueueTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
