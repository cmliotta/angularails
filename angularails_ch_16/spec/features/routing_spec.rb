require 'rails_helper'

describe "Routing Features" do

  feature 'Crew Members List' do
    context 'Routing show page' do
      it "has title Enterprise Crew", js: true do
        visit routing_show_path
        expect(page).to have_content("Enterprise Crew")
      end
      it "has content Kirk", js: true do
        visit routing_show_path
        expect(page).to have_content("Kirk")
      end
    end
  end

  feature 'Occupation display' do
    context 'Routing show page' do
      it "shows Enterprise Crew", js: true do
        visit routing_show_path
        click_link("Kirk")
        expect(page).to have_content("Captain")
      end
      it "shows Enterprise Crew", js: true do
        visit routing_show_path
        click_link("Spock")
        expect(page).to have_content("Officer")
      end
      it "shows Enterprise Crew", js: true do
        visit routing_show_path
        click_link("McCoy")
        expect(page).to have_content("Doctor")
      end
    end
  end

end