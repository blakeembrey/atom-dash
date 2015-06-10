map = require '../lib/grammar-map'

describe 'map', ->
  it 'should have a context for HTML', ->
    html = map['HTML']
    expect(html).toContain 'jquery'
    expect(html).toContain 'zepto'

  it 'should have a context for HTML (Rails)', ->
    html = map['HTML (Rails)']
    expect(html).toContain 'jquery'
    expect(html).toContain 'zepto'
    expect(html).toContain 'ruby'
    expect(html).toContain 'rubygems'
    expect(html).toContain 'rails'

  it 'should have a context for Coffeescript', ->
    coffee = map['CoffeeScript']
    expect(coffee).toContain 'coffee'
    expect(coffee).toContain 'jquery'

  it 'should have a context for Handlebars', ->
    handlebars = map['Handlebars']
    expect(handlebars).toContain 'html'
    expect(handlebars).toContain 'javascript'
    expect(handlebars).toContain 'yui'

  it 'should have a context for JavaScript', ->
    js = map['JavaScript']
    expect(js).toContain 'javascript'
    expect(js).toContain 'jquery'
    expect(js).toContain 'unity3d'
