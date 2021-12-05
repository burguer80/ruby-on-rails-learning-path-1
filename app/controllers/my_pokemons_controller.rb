class MyPokemonsController < ApplicationController
  def index
    p '--------'
  end

  def show

  end

  def create
    redirect_to my_pokemons_path
  end
end
