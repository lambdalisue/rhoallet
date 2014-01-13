# define jQuery.prototype.serializeObject if it is not defined
if not jQuery::serializeObject?
  jQuery::serializeObject = ->
    obj = {}
    for item in $(this).serializeArray()
      obj[item.name] = item.value
    return obj

class Controller
  constructor: (parent, pallet, opts) ->
    @pallet = pallet
    @elem = elem = $('<form>').addClass('rhoallet-controller')
    @elem.appendTo(parent)

    # construct DOM
    @_constructDOM()

    # pallet options
    NAMES = ['hue', 'saturation', 'lightness']
    updatePallet = ->
      opts = Options.extend(elem.serializeObject())
      pallet.configure(opts)
      pallet.draw()
    enableSelectAll = (elem) ->
      elem.click ->
        elem.select()
    enableIncrementKey = (elem, delta, min, max) ->
      elem.keydown (e) ->
        if e.keyCode == 38    # UP
          elem.increment()
        else if e.keyCode == 40
          elem.decrement()
      elem.increment = ->
        next = parseFloat(elem.val()) + delta
        if max? and max < next
          elem.val(max)
        else
          elem.val(next)
        elem.change()
        updatePallet()
      elem.decrement = ->
        next = parseFloat(elem.val()) - delta
        if min? and min > next
          elem.val(min)
        else
          elem.val(next)
        elem.change()
        updatePallet()
    # enable select all
    $('input', @elem).each ->
      enableSelectAll($(this))
    for name in NAMES then do (name) ->
      $n = $("##{name}_n").val(opts["#{name}_n"])
      enableIncrementKey($n, 1, 0, 99)
      $s = $("##{name}_s").val(opts["#{name}_s"])
      $e = $("##{name}_e").val(opts["#{name}_e"])
      enableIncrementKey($s, 0.01, 0, 1)
      enableIncrementKey($e, 0.01, 0, 1)
      $slider_dynamic = $("##{name}_slider_dynamic").slider
        min: 0
        max: 1
        step: 0.01
        range: true
        values: [$s.val(), $e.val()]
        slide: (e, ui) ->
          $s.val(ui.values[0])
          $e.val(ui.values[1])
          updatePallet()
      $s.change ->
        $slider_dynamic.slider('values', 0, $s.val())
      $e.change ->
        $slider_dynamic.slider('values', 1, $e.val())
      $_static = $("##{name}_static").val(opts["#{name}_static"])
      enableIncrementKey($_static, 0.01, 0, 1)
      $slider_static = $("##{name}_slider_static").slider
        min: 0
        max: 1
        step: 0.01
        value: $_static.val()
        slide: (e, ui) ->
          $_static.val(ui.value)
          updatePallet()
      $_static.change ->
        $slider_static.slider('value', $_static.val())

    # Pallet Mode event
    configures = {}
    for name in NAMES then do (name) ->
      configures["#{name}_enabled"] = $("##{name}_enabled")
      configures["#{name}_disabled"] = $("##{name}_disabled")
    palletMode = $('#pallet_mode')
    palletMode.change ->
      switch(palletMode.val())
        when 'HS'
          enabled = ['hue', 'saturation']
          disabled = ['lightness']
        when 'HL'
          enabled = ['hue', 'lightness']
          disabled = ['saturation']
        when 'SL'
          enabled = ['saturation', 'lightness']
          disabled = ['hue']
      for name in enabled
        configures["#{name}_enabled"].show()
        configures["#{name}_disabled"].hide()
      for name in disabled
        configures["#{name}_enabled"].hide()
        configures["#{name}_disabled"].show()
      updatePallet()
    palletMode.change()

    # form change event
    elem.change ->
      updatePallet()


  _constructDOM: ->
    # construct DOM elements by Hogan
    context =
      palletModes: [
        {name: 'HS', displayName: 'Hue / Saturation'},
        {name: 'HL', displayName: 'Hue / Lightness', selected: true},
        {name: 'SL', displayName: 'Saturation / Lightness'},
      ]
      palletOptionsConfigures: [
        {name: 'hue', displayName: 'Hue (H)', n: 6, s: 0, e: 1, static: 0.5, fn: 'linear', reverse: false},
        {name: 'saturation', displayName: 'Saturation (S)', n: 6, s: 0, e: 1, static: 0.5, fn: 'linear', reverse: false},
        {name: 'lightness', displayName: 'Lightness (L)', n: 6, s: 0.1, e: 0.9, static: 0.5, fn: 'linear', reverse: false},
      ]
      outputOptionsConfigures: [
        {name: 'quotation', displayName: 'Quotation mark', value: "'"},
        {name: 'delimiter', displayName: 'Delimiter', value: ", "},
      ]
    partial =
      palletOptions: templates.palletOptions
      outputOptions: templates.outputOptions
      configure: templates.configure
    @elem.html(templates.controller.render(context, partial))

