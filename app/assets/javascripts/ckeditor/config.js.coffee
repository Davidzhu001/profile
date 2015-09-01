CKEDITOR.editorConfig = (config) ->
  config.language = 'en'
  config.width = '1200'
  config.height = '1200'
  config.toolbar_Pure = [
    { name: 'styles',      items: [ 'Styles','Format','Font','FontSize' ] },
    { name: 'colors',      items: [ 'TextColor','BGColor' ] },
    { name: 'insert',      items: [ 'Image','Flash','Table','HorizontalRule'] },
  ]
  config.toolbar = 'Pure'
  true