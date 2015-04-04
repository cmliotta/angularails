require 'rails_helper'

describe GamesController do
  before :each do
    Game.destroy_all
    @game = Game.create(name: "game1")
  end

  describe "#index" do
    it "returns a 200 status" do
      get :index
      expect(response.status).to eq(200)
    end
    it "shows all games" do
      get :index
      expect(assigns(:games)).to eq Game.all
    end
  end

  describe "#show" do
    it "returns a 200 status" do
      get :show, id: @game.id
      expect(response.status).to eq(200)
    end
    it "shows one game" do
      get :show, id: @game.id
      expect(assigns(:game)).to eq @game
    end
  end
end