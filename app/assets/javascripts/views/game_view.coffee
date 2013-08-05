class Letterclick.Views.GameView extends Backbone.View
  el: '#game'
  initialize: ->
    @model.fetch()
