@Letterclick =
  Models: {}
  Collections: {}
  Views: {}

  start: ->
    $el = $('[data-game-id]')
    @startGame($el) if $el.length

  startGame: ($el) ->
    gameID = $el.data('game-id')
    game = new @Models.Game(id: gameID)
    new @Views.GameView(model: game, el: $el)

$ -> Letterclick.start()
$(document).on 'page:load', -> Letterclick.start()
