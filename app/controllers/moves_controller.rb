class MovesController < ApplicationController
  respond_to :json
  inherit_resources
  belongs_to :game
end
