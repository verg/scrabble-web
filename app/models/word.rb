class Word < ActiveRecord::Base

  has_many :plays
  before_save :downcase, :compute_score
  attr_accessible :word, :plays

  validates :word, presence: true
  validates :word, format: { with: /\A[a-zA-Z]+\z/ }

  def letter_scores
    {"A"=>1, "B"=>3, "C"=>3, "D"=>2, "E"=>1, "F"=>4, "G"=>2, "H"=>4, "I"=>1, "J"=>8,
     "K"=>5, "L"=>1, "M"=>3, "N"=>1, "O"=>1, "P"=>3, "Q"=>10, "R"=>1, "S"=>1, "T"=>1,
     "U"=>1, "V"=>4, "W"=>4, "X"=>8, "Y"=>4, "Z"=>10}
  end

  def compute_score
    self.score = 0
    word.each_char do |letter|
      self.score += letter_scores.fetch(letter.upcase)
    end
    self.score
  end

  def count_plays
    plays.count
  end

  private

  def downcase
    self.word = self.word.downcase
  end
end
