SVG = require './backbone.svg.coffee'

class SVGPlane extends Backbone.View
  _.extend @::, SVG

  tagName: 'svg'

  initialize: (options) ->
    @$el.attr
      width  : options.width
      height : options.height
    @el.setAttribute 'viewBox', options.viewBox

  createChild: (tagName) ->
    SvgClass = Backbone.View.extend SVG
    element =  new SvgClass {tagName}
    @$el.append element.render().$el
    return element

module.exports = SVGPlane
