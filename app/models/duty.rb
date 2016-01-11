class Duty < ActiveRecord::Base
  validates :date, presence: true
  validates :time, presence: true
  validates :name, presence: true
end
