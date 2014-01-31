class Letterclick.Views.GameStateView extends Backbone.View
  initialize: ->
    @gameView = @options.gameView
    @setElement(@gameView.el)
    @model.on 'change', @render, @

  events:
    'click .letter' : 'moveLetter'

  render: ->
    letters = @$el.find('.letter')
    owners = @model.get('squares')
    for [letter, owner] in _.zip(letters, owners)
      if owner == 1
        $(letter).addClass('player1')
      else if owner == 2
        $(letter).addClass('player2')
    @

  moveLetter: (e) ->
    letter = $(e.target).text()
    word = @gameView.$('.word').text()
    @gameView.$('.word').text(word + letter)
