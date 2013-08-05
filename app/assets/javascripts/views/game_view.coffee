class Letterclick.Views.GameView extends Backbone.View
  el: '#game'

  initialize: ->
    @model.fetch()
    self = @
    @model.on 'change', ->
      # TODO: is there a better way to get the view here??
      self.render()

  render: ->
    letters = @model.get('letters')
    rows = (letters.substr(i, 5) for i in [0..20] by 5)
    @$el.empty()
    @render_row(row) for row in rows

  render_row: (row) ->
    $row = $('<div>', class: 'row')
    $row.append $('<span>', class: 'letter', text: letter) for letter in row
    @$el.append $row
