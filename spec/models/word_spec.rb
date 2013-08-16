require 'spec_helper'

describe Word do
  describe 'validations' do
    it "is valid with a word" do
      expect(Word.new(:word => "hi")).to be_valid
    end

    it "is not valid without a word" do
      expect(Word.new).to_not be_valid
    end

    it "does not allow non-letters in words" do
      expect(Word.new(word: "12")).not_to be_valid
      expect(Word.new(word: "a a")).not_to be_valid
    end
  end

  describe '#compute_score' do
    let(:hello) { Word.new(word: "hello") }
    it "scores hello as 8" do
      hello.compute_score.should == 8
    end
  end

  describe 'case' do
    it 'saves to the db in downcase' do
      shouting = Word.create(word: "SHOUTING")
      shouting.word.should == "shouting"
    end
  end
end
