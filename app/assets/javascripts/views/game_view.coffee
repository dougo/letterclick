class Letterclick.Views.GameView extends Backbone.View
  el: '#game'

  initialize: ->
    state = @model.get('state')
    @state_view = new Letterclick.Views.GameStateView(model: state, game_view: @)
    @model.on 'change', @render, @
    @model.fetch()

  render: ->
    letters = @model.get('letters')
    rows = (letters.substr(i, 5) for i in [0..20] by 5)
    @$el.empty()
    @render_row(row) for row in rows
    @

  render_row: (row) ->
    $row = $('<div>', class: 'row')
    $row.append $('<span>', class: 'letter', text: letter) for letter in row
    @$el.append $row
