require 'rails_helper'

RSpec.describe User, type: :model do
  it { should have_many :items }
  it { should validate_uniqueness_of :email }
end
