require 'rails_helper'

describe 'the root path' do
  it 'will visit the root path' do
    visit root_path
    expect(page).to have_content "Welcome"
  end
end
