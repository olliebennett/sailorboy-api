require 'rails_helper'

RSpec.describe Duty do
  it { should validate_presence_of(:date) }
  it { should validate_presence_of(:time) }
  it { should validate_presence_of(:name) }
end
