#= require test_helper

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

    assert.hasClass   W, 'player1'
    assert.hasNoClass W, 'player2'

    assert.hasNoClass G, 'player1'
    assert.hasClass   G, 'player2'

    assert.hasNoClass B, 'player1'
    assert.hasNoClass B, 'player2'
