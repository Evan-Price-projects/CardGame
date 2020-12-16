class Table < ActiveRecord::Base
  has_many :cards
  has_many :users
  validates :tablename, uniqueness: true
end