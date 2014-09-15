
path = require 'path'
fs = require 'fs'
through = require 'through2'
html = require 'cirru-html'
ext = require('gulp-util').replaceExtension
PluginError = require('gulp-util').PluginError

html.setResolver (basePath, child, scope) ->
  dest = path.join (path.dirname basePath), child
  scope?['@filename'] = dest
  fs.readFileSync dest, 'utf8'

module.exports = (options) ->
  opts = options or {}

  through.obj (file, enc, cb) ->
    opts.filename = file.path

    file.path = ext file.path, '.html'

    if file.isStream()
      cb new PluginError('gulp-cirru-html', 'Streaming not supported')
    else if file.isBuffer()
      try
        content = String(file.contents)
        opts.data['@filename'] = opts.filename
        result = html.render content, opts.data
        file.contents = new Buffer result
        cb null, file
      catch err
        cb new PluginError('gulp-jade', err)