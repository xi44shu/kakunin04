class Calendar < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :time_zone
  belongs_to :user
  belongs_to :team
  belongs_to :size

end
