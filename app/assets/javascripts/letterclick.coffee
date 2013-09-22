@Letterclick =
  Models: {}
  Collections: {}
  Views: {}

  start: ->
    $el = $('[data-game-id]')
    @start_game($el) if $el.length

  start_game: ($el) ->
    game_id = $el.data('game-id')
    game = new @Models.Game(id: game_id)
    new @Views.GameView(model: game, el: $el)

$ -> Letterclick.start()
$(document).on 'page:load', -> Letterclick.start()
