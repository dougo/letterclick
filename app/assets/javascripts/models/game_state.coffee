class Letterclick.Models.GameState extends Backbone.Model
  url: ->
    @get('game').url() + '/state'
