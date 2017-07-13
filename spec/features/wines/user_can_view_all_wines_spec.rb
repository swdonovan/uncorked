require 'rails_helper'

RSpec.feature 'Guest can view a list of all wines' do

  context 'without being logged in' do
    let!(:wines) { create_list(:wine, 35) }

    it 'guest can view a list of wines' do
      visit root_path

      within '.right' do
        click_on 'Wines'
      end

      expect(current_path).to eq wines_path

      html_wines = page.all('.wine')
      expect(html_wines.count).to eq 30

      expect(html_wine[0]).to have_link(wine.first.name, href: wine_path(wine.first))
      expect(html_wine[0]).to have_content(wine.first.varietal)
      expect(html_wine[0]).to have_content(wine.first.vintage)
      expect(html_wine[0]).to have_content(wine.first.vineyard)
      expect(html_wine[0]).to have_content(wine.first.rating)
      expect(html_wine[0]).to have_content(wine.first.description)

      expect(page).to have_content "Next Page"
    end

    it 'guest can view second page of wines' do
      visit root_path

      within '.right' do
        click_on 'Wines'
      end

      click_on 'Next Page'

      expect(current_path).to eq wines_path

      html_wines = page.all('.wine')
      expect(html_wines.count).to eq 5

      expect(html_wine[4]).to have_link(wine.last.name, href: wine_path(wine.last))
      expect(html_wine[4]).to have_content(wine.last.varietal)
      expect(html_wine[4]).to have_content(wine.last.vintage)
      expect(html_wine[4]).to have_content(wine.last.vineyard)
      expect(html_wine[4]).to have_content(wine.last.rating)
      expect(html_wine[4]).to have_content(wine.last.description)

      expect(page).to have_content "Previous Page"
    end
  end
end
