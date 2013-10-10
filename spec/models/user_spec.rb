require 'spec_helper'

describe User do
  it { should validate_uniqueness_of(:name) }

  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:password) }
  it { should have_many(:answers)}
  it { should have_many(:questions)}

end