"use strict"

Gruntfile = require 'backstrap-gruntfile/Gruntfile.coffee'

# # Globbing
# for performance reasons we're only matching one level down:
# 'test/spec/{,*/}*.js'
# use this if you want to recursively match all subfolders:
# 'test/spec/**/*.js'
module.exports = (grunt) ->
  Gruntfile grunt,
    scripts:
      'dist/scripts/backbone.svg.js': 'app/scripts/backbone.svg.coffee'
