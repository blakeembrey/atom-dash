_ = require('underscore-plus')

web    = ['html', 'svg', 'css', 'bootstrap', 'foundation', 'awesome', 'statamic']
js     = ['javascript', 'jquery', 'jqueryui', 'jquerym', 'angularjs', 'backbone', 'marionette', 'meteor', 'moo', 'prototype', 'ember', 'lodash', 'underscore', 'sencha', 'extjs', 'titanium', 'knockout', 'zepto', 'cordova', 'phonegap', 'yui', 'unity3d']
coffee = ['coffee']
php    = ['php', 'wordpress', 'drupal', 'zend', 'laravel', 'yii', 'joomla', 'ee', 'codeigniter', 'cakephp', 'phpunit', 'symfony', 'typo3', 'twig', 'smarty', 'phpp', 'mysql', 'sqlite', 'mongodb', 'psql', 'redis', 'html', 'statamic', 'svg', 'css', 'bootstrap', 'foundation', 'awesome']

module.exports =
  'ActionScript':
    ['actionscript']
  'Boo':
    ['unity3d']
  'C':
    ['c', 'glib', 'gl2', 'gl3', 'gl4', 'manpages']
  'C++':
    ['cpp', 'net', 'boost', 'qt', 'cvcpp', 'cocos2dx', 'c', 'manpages']
  'C#':
    ['net', 'mono', 'unity3d']
  'Objective-J':
    ['cappuccino']
  'Clojure':
    ['clojure']
  'CoffeeScript':
    _.union coffee, web, js
  'CoffeeScript (Literate)':
    _.union coffee, web, js
  'ColdFusion':
    ['cf']
  'CSS':
    ['css', 'bootstrap', 'foundation', 'cordova', 'phonegap']
  'Dart':
    ['dartlang', 'polymerdart', 'angulardart']
  'Elixir':
    ['elixir']
  'Erlang':
    ['erlang']
  'Go':
    ['go', 'godoc']
  'Haskell':
    ['haskell']
  'Ruby Haml':
    ['haml']
  'Handlebars':
    _.union web, js
  'HTML':
    _.union web, js
  'HTML (Rails)':
    _.union ['ruby', 'rubygems', 'rails'], web, js
  'Jade':
    ['jade']
  'Java':
    ['java', 'javafx', 'grails', 'groovy', 'playjava', 'spring', 'cvj', 'processing']
  'JavaScript':
    js
  'LESS':
    ['less', 'css', 'bootstrap', 'foundation', 'awesome', 'cordova', 'phonegap']
  'Lisp':
    ['lisp']
  'Literate Haskell':
    ['haskell']
  'Lua':
    ['lua', 'corona']
  'GitHub Markdown':
    ['markdown']
  'Objective-C':
    ['iphoneos', 'macosx', 'appledoc', 'cocos2d', 'cocos3d', 'kobold2d', 'sparrow', 'c', 'manpages']
  'Objective-C++':
    ['iphoneos', 'macosx', 'appledoc', 'cocos2d', 'cocos3d', 'kobold2d', 'sparrow', 'c', 'manpages', 'cpp', 'cocos2dx']
  'OCaml':
    ['ocaml']
  'Perl':
    ['perl', 'manpages']
  'PHP':
    _.union php, js
  'Processing':
    ['processing']
  'Puppet':
    ['puppet']
  'Python':
    ['python', 'django', 'twisted', 'sphinx', 'flask', 'tornado', 'sqlalchemy', 'numpy', 'scipy', 'salt', 'cvp']
  'R':
    ['r']
  'Ruby':
    ['ruby', 'rubygems', 'rails']
  'Ruby on Rails':
    ['ruby', 'rubygems', 'rails']
  'Rust':
    ['rust']
  'Sass':
    ['sass', 'compass', 'bourbon', 'neat', 'css']
  'Scala':
    ['scala', 'akka', 'playscala']
  'Shell Scripts':
    ['bash', 'manpages']
  'SQL':
    ['mysql', 'sqlite', 'psql']
  'SQL (Rails)':
    ['ruby', 'rubygems', 'rails']
  'Stylus':
    ['stylus', 'css', 'bootstrap', 'foundation', 'cordova', 'phonegap']
  'Tcl':
    ['tcl']
  'YAML':
    ['chef', 'ansible']
