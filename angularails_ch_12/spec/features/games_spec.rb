require 'rails_helper'

describe "Games Features" do
  before :each do
    Game.destroy_all
    @game = Game.create(name: "game1")
  end

  feature 'Lists All Games' do
    context 'Games index page' do
      it "lists all of the games" do
        visit games_path
        expect(page).to have_content(@game.name)
      end
    end
  end

end