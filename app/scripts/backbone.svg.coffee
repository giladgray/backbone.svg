# from http://nocircleno.com/blog/svg-with-backbone-js/, translated to CoffeeScript
module.exports = SvgMixin =
  nameSpace: 'http://www.w3.org/2000/svg'

  _ensureElement: ->
    if @el
      @setElement _.result(@, 'el'), false
    else
      attrs = _.extend {}, _.result @, 'attributes'
      if @id then attrs.id = _.result @, 'id'
      if @className then attrs['class'] = _.result @, 'className'
      $el = $(window.document.createElementNS(_.result(@, 'nameSpace'), _.result(@, 'tagName'))).attr attrs
      @setElement $el, false

class SvgView extends Backbone.View
  _.extend @::, SvgMixin

Backbone?.SVG = SvgMixin
Backbone?.SvgView = SvgView

