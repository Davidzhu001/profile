$(document).on 'page:load', ->
    if $('#article_content').length > 0
      KindEditor.create '#article_content',
                      "width":"100%",
                      "height":300,
                      "allowFileManager":true,
                      "uploadJson":"/kindeditor/upload",
                      "fileManagerJson":"/kindeditor/filemanager",
                      "items":["fontname","fontsize","|","forecolor","hilitecolor","bold","italic","underline","removeformat","|","justifyleft","justifycenter","justifyright","insertorderedlist","insertunorderedlist","|","emoticons","image","link"]