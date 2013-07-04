class GameStatesController < ApplicationController
  respond_to :json
  inherit_resources
  belongs_to :game
  defaults :collection_name => :states

  # For the singular path /games/:game_id/state, return the current game state.
  def resource
    params[:id] ? super : parent.state
  end
end
