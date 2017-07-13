require 'rails_helper'

RSpec.feature 'Guest can view a list of all venues' do
  let!(:venues) { create_list(:venue, 3) }
  context 'without being logged in' do
    it 'guest can view a list of venues' do
      visit root_path

      within '.right' do
        click_on 'Venues'
      end

      expect(current_path).to eq venues_path

      html_venues = page.all(".venue")
      expect(html_venues.count).to eq 3
      expect(html_venues[0]).to have_link(venues.first.name, href: venue_path(venues.first))
      expect(html_venues[0]).to have_content(venues.first.street_address)
      expect(html_venues[0]).to have_content(venues.first.city)
      expect(html_venues[0]).to have_content(venues.first.state)
      expect(html_venues[0]).to have_content(venues.first.zip)
    end
  end
end
