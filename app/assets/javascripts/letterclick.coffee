@Letterclick =
  Models: {}
  Collections: {}
  Views: {}

  start: (id) ->
    game = new Letterclick.Models.Game(id: id)
    new Letterclick.Views.GameView(model: game)
