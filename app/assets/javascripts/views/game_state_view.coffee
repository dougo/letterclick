class Letterclick.Views.GameStateView extends Backbone.View
  el: '#game'

  initialize: ->
    @model.fetch()
