#= require test_helper

suite 'GameStateView', ->
  setup ->
    game = new Letterclick.Models.Game(id: 1)
    @view = new Letterclick.Views.GameView(model: game).state_view
    MockServer.respond()

  test 'has a game_view', ->
    assert.instanceOf Letterclick.Views.GameView, @view.game_view

  test 'fetches the GameState', ->
    assert.equal 2, @view.model.get('turn')
    assert.equal 25, @view.model.get('squares').length

  test 'colors squares by owner', ->
    assert.equal 25, @view.$('.letter').length
    W = @view.$('.letter:contains("W")')
    G = @view.$('.letter:contains("G")')
    B = @view.$('.letter:contains("B")')

    assert.hasClass 'player1', W
    refute.hasClass 'player2', W

    refute.hasClass 'player1', G
    assert.hasClass 'player2', G

    refute.hasClass 'player1', B
    refute.hasClass 'player2', B

  test 'moves letters to the word view when you click on it', ->
    @view.$('.letter:contains("B")').click()
    word = @view.game_view.$('.word')
    assert.hasText 'B', word

    @view.$('.letter:contains("A")').click()
    assert.hasText 'BA', word

    @view.$('.letter:contains("D")').click()
    assert.hasText 'BAD', word
