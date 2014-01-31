#= require test_helper

suite 'Letterclick', ->
  test 'exists in the global namespace', ->
    assert.instanceOf Object, Letterclick.Models

  test 'has namespaces', ->
    assert.instanceOf Object, Letterclick.Models
    assert.instanceOf Object, Letterclick.Collections
    assert.instanceOf Object, Letterclick.Views

  test '.start does not find a game container', ->
    assert.same undefined, Letterclick.start()

  test '.start finds a game container', ->
    $('body').attr('data-game-id', '1')
    assert.instanceOf Letterclick.Views.GameView, Letterclick.start()

  test '.start_game makes a model and view', ->
    $('body').data('game-id', 1)
    view = Letterclick.start_game($('body'))
    assert.instanceOf Letterclick.Views.GameView, view
    assert.instanceOf Letterclick.Models.Game, view.model
    assert.equal 1, view.model.id
