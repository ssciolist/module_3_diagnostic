require 'rails_helper'

describe 'As a user' do
  describe 'when I visit root' do
    it 'I can search my zipcode for the 10 closest stations within 6 miles' do
      visit '/'

      fill_in 'q', with: 80203
      click_on 'Locate'

      expect(current_path).to eq('/search')

      expect(page).to have_css(".station", count: 10)
      # within 6 miles sorted by distance << How to test this?
      # And the stations should be limited to Electric and Propane

      within(first(".station")) do
        expect(page).to have_css(".name")
        expect(page).to have_css(".address")
        expect(page).to have_css(".fuel_types")
        expect(page).to have_css(".distance")
        expect(page).to have_css(".access_times")
      end
    end
  end
end
