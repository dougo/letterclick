class Letterclick.Views.GameStateView extends Backbone.View
  initialize: ->
    @game_view = @options.game_view
    @setElement(@game_view.el)
    @model.on 'change', @render, @

  render: ->
    letters = @$el.find('.letter')
    owners = @model.get('squares')
    for [letter, owner] in _.zip(letters, owners)
      if owner == 1
        $(letter).addClass('player1')
      else if owner == 2
        $(letter).addClass('player2')
    @
