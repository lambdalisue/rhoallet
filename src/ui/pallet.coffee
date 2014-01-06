#<< utils/color
#<< utils/segment
#<< utils/selectall

class Cell
  constructor: (@rgb) ->
    hsl = Colors.rgbToHsl.apply(Colors, @rgb)
    h = Math.floor(hsl[0]*100)/100
    s = Math.floor(hsl[1]*100)/100
    l = Math.floor(hsl[2]*100)/100
    @hex = Colors.hexify(@rgb)
    text = "<span>#{@hex}<br><small>H: #{h}<br>S: #{s}<br>L: #{l}</small></span>"
    @elem = $('<li>').addClass('rhoallet-pallet-cell')
                     .css('background-color', @hex)
                     .css('color', Colors.binarize(Colors.invert(@rgb)))
                     .html(text)
    # select text by clicking
    @elem.click ->
      selectAll(this)

class Pallet
  constructor: (parent, output, opts) ->
    @output = output
    @elem = $('<ul>').addClass('rhoallet-pallet')
    @elem.appendTo(parent)
    @configure(opts)

  configure: (opts) ->
    # configure
    attributes = ['hue', 'saturation', 'lightness']
    for attr in attributes
      @[attr] = new Segment(opts["#{attr}_n"],
                            opts["#{attr}_s"],
                            opts["#{attr}_e"],
                            opts["#{attr}_fn"])
      @[attr].static = opts["#{attr}_static"]
    @palletMode = opts.pallet_mode
    @quotation = opts.quotation
    @delimiter = opts.delimiter
    @opts = opts
    return @

  draw: (updateOutput=true) ->
    # create h, s, l array
    switch(@palletMode)
      when 'HS'
        hs = @hue.toArray()
        ss = @saturation.toArray()
        ls = [@lightness.static]
        hs.newline = true
      when 'HL'
        hs = @hue.toArray()
        ss = [@saturation.static]
        ls = @lightness.toArray()
        hs.newline = true
      when 'SL'
        hs = [@hue.static]
        ss = @saturation.toArray()
        ls = @lightness.toArray()
        ss.newline = true
      else
        throw "Unknown `pallet_mode` (#{@palletMode}) was specified."
    # create pallet fragment
    frag = document.createDocumentFragment()
    rows = new Array
    cols = new Array
    for h in hs 
      for s in ss
        for l in ls
          cell = new Cell(Colors.hslToRgb(h, s, l))
          frag.appendChild(cell.elem.get(0))
          cols.push(cell.hex)
        if ss.newline?
          cell.elem.addClass('last')
          rows.push(cols)
          cols = new Array
      if hs.newline?
        cell.elem.addClass('last')
        rows.push(cols)
        cols = new Array
    # replace children
    @elem.empty()
    @elem[0].appendChild(frag)
    # store colors
    @colors = rows
    if updateOutput
      @_renderOutput(rows)
    return @

  _renderOutput: (rows) ->
    ascii = ""
    for cols in rows
      for color in cols
        color = "<span style='color: #{color}' class='color'>#{color}</span>"
        color = @quotation + color + @quotation + @delimiter
        ascii += color
      ascii += "\n"
    @output.html(ascii)

