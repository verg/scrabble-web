require 'spec_helper'

describe Play do
  let(:play) { Play.create }
  it { should be_valid }

  it 'should have a date' do
    play.date.should_not be_nil
  end
end
