
gulp = require 'gulp'
watch = require 'gulp-watch'
html = require '../compile'
reloader = require 'gulp-reloader'

gulp.task 'watch', ->
  data =
    name: 'demo'
  reloader.listen()

  gulp
  .src '*.cirru'
  .pipe watch()
  .pipe (html {data})
  .pipe gulp.dest('./')
  .pipe reloader('demo')