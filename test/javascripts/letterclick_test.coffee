#= require test_helper

suite 'Letterclick', ->
  test 'exists in the global namespace', ->
    assert.isObject Letterclick.Models

  test 'has namespaces', ->
    assert.isObject Letterclick.Models
    assert.isObject Letterclick.Collections
    assert.isObject Letterclick.Views

  test '.start does not find a game container', ->
    assert.isUndefined Letterclick.start()

  test '.start finds a game container', ->
    $('body').attr('data-game-id', '1')
    assert.instanceOf Letterclick.start(), Letterclick.Views.GameView

  test '.start_game makes a model and view', ->
    $('body').data('game-id', 1)
    view = Letterclick.start_game($('body'))
    assert.instanceOf view, Letterclick.Views.GameView
    assert.instanceOf view.model, Letterclick.Models.Game
    assert.strictEqual view.model.id, 1
