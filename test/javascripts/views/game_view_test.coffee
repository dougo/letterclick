#= require test_helper

suite 'GameView', ->
  setup ->
    @game = new Letterclick.Models.Game(id: 1)
    @view = new Letterclick.Views.GameView(model: @game)
    MockServer.respond()

  test 'has a stateView', ->
    assert.instanceOf Letterclick.Views.GameStateView, @view.stateView

  test 'fetches the Game', ->
    assert.equal 25, @game.get('letters').length

  test 'shows the letters', ->
    letters = @view.$('.letter')
    assert.hasText 'A', letters.first()
    assert.hasText 'Y', letters.last()

  test 'shows the letters in rows', ->
    rows = @view.$('.row')
    assert.hasText 'ABCDE', rows.first()
    assert.hasText 'UVWXY', rows.last()
