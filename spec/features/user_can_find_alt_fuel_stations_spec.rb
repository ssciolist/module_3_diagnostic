require 'rails_helper'

describe 'As a user' do
  describe 'when I visit root' do
    it 'I can search my zipcode for the 10 closest stations within 6 miles' do
      VCR.use_cassette("spec/cassettes/find_stations_with_limit_with_radius_w_fuel_type") do
        visit '/'

        fill_in 'q', with: 80203
        click_on 'Locate'

        expect(current_path).to eq('/search')

        expect(page).to have_css(".station", count: 10)
        # within 6 miles sorted by distance << How to test this?

        expect(page).to_not have_content("BD")
        expect(page).to_not have_content("CNG")
        expect(page).to_not have_content("E85")
        expect(page).to_not have_content("HY")
        expect(page).to_not have_content("LNG")

        within(first(".station")) do
          expect(page).to have_css(".name")
          expect(page).to have_css(".address")
          expect(page).to have_css(".fuel_types")
          expect(page).to have_css(".distance")
          expect(page).to have_css(".access_times")
        end

        within all(".station").last do
          within(".distance") do
            expect(page).to_not have_content('6.')
          end
        end
      end
    end
  end
end
