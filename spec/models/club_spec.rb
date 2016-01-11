require 'rails_helper'

RSpec.describe Club do
  it { should validate_presence_of(:name) }
end
