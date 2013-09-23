#= require test_helper

# TODO: this should be exported by test_helper... somehow.
refute = chai.refute

suite 'GameStateView', ->
  setup ->
    game = new Letterclick.Models.Game(id: 1)
    @view = new Letterclick.Views.GameView(model: game).state_view
    MockServer.respond()

  test 'has a game_view', ->
    assert.isObject @view.game_view

  test 'fetches the GameState', ->
    assert.equal @view.model.get('turn'), 2
    assert.equal @view.model.get('squares').length, 25

  test 'colors squares by owner', ->
    assert.equal @view.$('.letter').length, 25
    W = @view.$('.letter:contains("W")')
    G = @view.$('.letter:contains("G")')
    B = @view.$('.letter:contains("B")')

    assert.hasClass W, 'player1'
    refute.hasClass W, 'player2'

    refute.hasClass G, 'player1'
    assert.hasClass G, 'player2'

    refute.hasClass B, 'player1'
    refute.hasClass B, 'player2'
