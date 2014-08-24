
Gulp plugin for Cirru HTML
----

### Usage

```
npm i --save-dev gulp-cirru-html
```

See `test/gulpfile.coffee`:

```coffee
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
```

### license MIT