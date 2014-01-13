spawn = require('child_process').spawn

exec = (file, args, done) ->
  proc = spawn(file, args)
  proc.stdout.on 'data', (data) -> process.stdout.write(data)
  proc.stderr.on 'data', (data) -> process.stderr.write(data)
  proc.on('exit', (code) -> done(code)) if done
  return proc

task 'install', 'install required npm packages', (options) ->
  args = ['install', 'fs-extra']
  proc = exec 'npm', args

task 'update', 'update working demo', (options) ->
  fs = require('fs-extra')
  url="http://github.com/lambdalisue/rhoallet"
  tmp=".tmp"
  args = ['clone', url, tmp]
  proc = exec 'git', args, (code) ->
    fs.copy "#{tmp}/www/index.html", "index.html"
    fs.copy "#{tmp}/www/js/", "js"
    fs.copy "#{tmp}/www/css/", "css"
