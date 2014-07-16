###
A mixin that allows a Backbone.View to create an SVG element.

Standard Backbone.Views use jQuery to create $el which always creates elements
in the HTML5 namespace. This mixin overrides the default element creation
behavior to accept a `nameSpace` option and pass that to the native
`document.createElementNS(nameSpace, tagName)` function.

@see http://nocircleno.com/blog/svg-with-backbone-js/, translated to CoffeeScript
###
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

###
A Backbone.View with SVG already mixed in, for your convenience.
###
class SvgView extends Backbone.View
  _.extend @::, SvgMixin

# attach the mixin and the view to the global Backbone object, if it exists
Backbone?.SVG = SvgMixin
Backbone?.SvgView = SvgView
