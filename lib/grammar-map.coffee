css = [
  'css',
  'bootstrap',
  'foundation',
  'awesome'
  'cordova',
  'phonegap'
]

sass = [
  'sass',
  'compass',
  'bourbon',
  'neat'
].concat(css)

js = [
  'javascript',
  'jquery',
  'jqueryui',
  'jquerym',
  'angularjs',
  'backbone',
  'marionette',
  'meteor',
  'moo',
  'prototype',
  'ember',
  'lodash',
  'underscore',
  'sencha',
  'extjs',
  'titanium',
  'knockout',
  'zepto',
  'cordova',
  'phonegap',
  'yui',
  'unity3d'
]

web = [
  'html',
  'svg',
  'statamic'
].concat(js, css)

coffeescript = [
  'coffee'
].concat(web)

php = [
  'php',
  'wordpress',
  'drupal',
  'zend',
  'laravel',
  'yii',
  'joomla',
  'ee',
  'codeigniter',
  'cakephp',
  'phpunit',
  'symfony',
  'typo3',
  'twig',
  'smarty',
  'phpp',
  'mysql',
  'sqlite',
  'mongodb',
  'psql',
  'redis',
  'html',
  'statamic',
  'svg',
  'css',
  'bootstrap',
  'foundation',
  'awesome'
]

ruby = [
  'ruby',
  'rubygems',
  'rails'
]

objectiveC = [
  'iphoneos',
  'macosx',
  'appledoc',
  'cocos2d',
  'cocos3d',
  'kobold2d',
  'sparrow',
  'c',
  'manpages'
]

module.exports =
  'ActionScript': [
    'actionscript'
  ]
  'Boo': [
    'unity3d'
  ]
  'C': [
    'c',
    'glib',
    'gl2',
    'gl3',
    'gl4',
    'manpages'
  ]
  'C++': [
    'cpp',
    'net',
    'boost',
    'qt',
    'cvcpp',
    'cocos2dx',
    'c',
    'manpages'
  ]
  'C#': [
    'net',
    'mono',
    'unity3d'
  ]
  'Objective-J': [
    'cappuccino'
  ]
  'Clojure': [
    'clojure'
  ]
  'CoffeeScript': coffeescript
  'CoffeeScript (Literate)': coffeescript
  'ColdFusion': [
    'cf'
  ]
  'CSS': css
  'Dart': [
    'dartlang',
    'polymerdart',
    'angulardart'
  ]
  'Elixir': [
    'elixir'
  ]
  'Erlang': [
    'erlang'
  ]
  'Go': [
    'go',
    'godoc'
  ]
  'Haskell': [
    'haskell'
  ]
  'Ruby Haml': [
    'haml'
  ]
  'Handlebars': web
  'HTML': web
  'HTML (Rails)': [
    'ruby',
    'rubygems',
    'rails'
  ].concat(web)
  'Jade': [
    'jade'
  ].concat(web)
  'Java': [
    'java',
    'javafx',
    'grails',
    'groovy',
    'playjava',
    'spring',
    'cvj',
    'processing'
  ]
  'JavaScript': js
  'LESS': css
  'Lisp': [
    'lisp'
  ]
  'Literate Haskell': [
    'haskell'
  ]
  'Lua': [
    'lua',
    'corona'
  ]
  'GitHub Markdown': [
    'markdown'
  ]
  'Objective-C': objectiveC
  'Objective-C++': [
    'cpp',
    'cocos2dx'
  ].concat(objectiveC)
  'OCaml': [
    'ocaml'
  ]
  'Perl': [
    'perl',
    'manpages'
  ]
  'PHP': php.concat(web)
  'Processing': [
    'processing'
  ]
  'Puppet': [
    'puppet'
  ]
  'Python': [
    'python',
    'django',
    'twisted',
    'sphinx',
    'flask',
    'tornado',
    'sqlalchemy',
    'numpy',
    'scipy',
    'salt',
    'cvp'
  ]
  'R': [
    'r'
  ]
  'Ruby': ruby
  'Ruby on Rails': ruby
  'Rust': [
    'rust'
  ]
  'Sass': sass
  'SCSS': sass
  'Scala': [
    'scala',
    'akka',
    'playscala'
  ]
  'Shell Scripts': [
    'bash',
    'manpages'
  ]
  'SQL': [
    'mysql',
    'sqlite',
    'psql'
  ]
  'SQL (Rails)': ruby
  'Stylus': css
  'Tcl': [
    'tcl'
  ]
  'YAML': [
    'chef',
    'ansible'
  ]
