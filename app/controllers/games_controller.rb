class GamesController < ApplicationController
  respond_to :json, :html # TODO: require params[:api_version] when :json
  inherit_resources
  actions :index, :show, :create
end
