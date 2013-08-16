class Play < ActiveRecord::Base
  belongs_to :word
  attr_accessible :date
end
