class PeopleController < ApplicationController
  def index
    @people = Person.alphabetical
  end

  def show
    @person = Person.includes(:parties, votes: :decision).find(params[:id])
  end
end
