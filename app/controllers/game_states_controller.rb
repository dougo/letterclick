class GameStatesController < ApplicationController
  respond_to :json
  inherit_resources
  belongs_to :game
  defaults :collection_name => :states
end
