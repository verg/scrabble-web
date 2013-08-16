class Play < ActiveRecord::Base
  before_save :set_date

  belongs_to :word
  attr_accessible :date

  private

  def set_date
    self.date = DateTime.now
  end
end
