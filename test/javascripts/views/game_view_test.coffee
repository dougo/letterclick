#= require test_helper

suite 'GameView', ->
  setup ->
    @game = new Letterclick.Models.Game(id: 1)
    @view = new Letterclick.Views.GameView({ model: @game })
    MockServer.respond()

  test 'has a state_view', ->
    assert.instanceOf @view.state_view, Letterclick.Views.GameStateView

  test 'fetches the Game', ->
    assert.equal @game.get('letters').length, 25

  test 'shows the letters', ->
    letters = @view.$('.letter')
    assert.hasText letters.first(), 'A'
    assert.hasText letters.last(),  'Y'

  test 'shows the letters in rows', ->
    rows = @view.$('.row')
    assert.hasText rows.first(), 'ABCDE'
    assert.hasText rows.last(),  'UVWXY'
