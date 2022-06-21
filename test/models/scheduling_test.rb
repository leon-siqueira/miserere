# frozen_string_literal: true

# == Schema Information
#
# Table name: schedulings
#
#  id                  :bigint           not null, primary key
#  hour                :time
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#  confession_queue_id :bigint           not null
#
# Indexes
#
#  index_schedulings_on_confession_queue_id  (confession_queue_id)
#
# Foreign Keys
#
#  fk_rails_...  (confession_queue_id => confession_queues.id)
#
require 'test_helper'

class SchedulingTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
