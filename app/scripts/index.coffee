SvgPlane = require './SvgPlane.coffee'

console.log 'hello from coffee'

svg = new SvgPlane
  width: 100
  height: 100
  viewBox: '0 0 200 200'

class CircleView extends Backbone.SvgView

  tagName: 'circle'

  events:
    'click': 'makeRed'

  initialize: (options) ->
    @$el.attr _.pick options, 'cx', 'cy', 'r'

  makeRed: ->
    @$el.css 'fill', 'red'
    setTimeout (=> @$el.css 'fill', 'black'), 500

svg.$el.append (new CircleView({cx: 50, cy: 50, r: 30})).render().$el

window.SvgPlane = SvgPlane

$('body').append svg.render().$el
