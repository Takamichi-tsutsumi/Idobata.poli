class PoliticalPartiesController < ApplicationController
  def index
    @political_parties = PoliticalParty.all
  end
end
