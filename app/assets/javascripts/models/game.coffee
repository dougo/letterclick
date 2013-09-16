class Letterclick.Models.Game extends Backbone.Model
  urlRoot: '/api/v1/games'

  defaults: ->
    'state': new Letterclick.Models.GameState(game: @)

  fetch: ->
    jqxhr = super
    @get('state').fetch()
    jqxhr
