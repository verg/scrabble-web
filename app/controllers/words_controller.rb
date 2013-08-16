class WordsController < ApplicationController
  def index
    @last_word = Word.last
    @new_word = Word.new
    @previous_words = Word.last(3)
  end

  def create
    @new_word = Word.new(params[:word])
    if !@new_word.save
      flash[:notice] = "Sorry, please enter at least one word made up of only letters"
    end
    redirect_to words_path
  end
end
