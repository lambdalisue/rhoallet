Options =
  extend: (opts) ->
    # overwrite empty key with default value
    defaultOpts =
      hue_n: 6
      hue_s: 0
      hue_e: 1
      hue_static: 0.5
      hue_fn: 'linear'
      saturation_n: 10
      saturation_s: 0
      saturation_e: 1
      saturation_static: 0.5
      saturation_fn: 'linear'
      lightness_n: 10
      lightness_s: 0.1
      lightness_e: 0.9
      lightness_static: 0.5
      lightness_fn: 'linear'
      pallet_mode: 'HS'
    opts = jQuery.extend(defaultOpts, opts)
    # parse numerics
    floats = [
      'hue_s', 'hue_e', 'hue_static',
      'saturation_s', 'saturation_e', 'saturation_static',
      'lightness_s', 'lightness_e', 'lightness_static',
    ]
    ints = ['hue_n', 'saturation_n', 'lightness_n']
    for key in floats
      opts[key] = parseFloat(opts[key])
    for key in ints
      opts[key] = parseInt(opts[key])
    return opts

  deserialize: (params) ->
    opts = {}
    try
      opts = JSON.parse(params) if params
    finally
      return Options.extend(opts)

  serialize: (opts) ->
    opts = Options.extend(opts)
    try
      return JSON.stringify(opts)
    catch e
      return ""

