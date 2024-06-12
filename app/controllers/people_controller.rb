class PeopleController < ApplicationController
  def index
    @people = Person.alphabetical
  end

  def show
    @person = Person.includes(:parties).find(params[:id])

    set_page_and_extract_portion_from @person.votes.includes(:decision)
  end
end
