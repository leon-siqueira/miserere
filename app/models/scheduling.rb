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
class Scheduling < ApplicationRecord
  belongs_to :confession_queue

  validates :hour, uniqueness: { scope: :confession_queue_id,
                                 message: 'Este horário já foi selecionado por outra pessoa' }
  validates :hour, inclusion: { in: :valid_schedulings,
                                message: 'Horário inválido' }

  def valid_schedulings
    valid_schedulings = []
    confession_queue = ConfessionQueue.find(confession_queue_id)
    minute_step = confession_queue.start_time
    until valid_schedulings.include?(confession_queue.end_time.strftime('%R'))
      valid_schedulings << minute_step.strftime('%R')
      minute_step += 15.minutes
    end

    valid_schedulings
  end
end
