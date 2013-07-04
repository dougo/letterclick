class MovesController < ApplicationController
  respond_to :json
  inherit_resources
  belongs_to :game

  def permitted_params
    params.permit(:move => { :indices => [] })
  end

  def build_resource
    @move ||= parent.move(params[:move][:indices])
  end
end
