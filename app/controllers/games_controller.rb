class GamesController < ApplicationController
  respond_to :json
  inherit_resources
  actions :index, :show, :create
end
