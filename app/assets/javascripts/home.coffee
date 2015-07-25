# ************* 

# Scroll to top 
# 返回首页
# ************* 
$(document).ready ->
  $(window).scroll ->
    if $(this).scrollTop() > 200
      $(".totop").fadeIn()
    else
      $(".totop").fadeOut()

  $(".totop a").click (e) ->
    e.preventDefault()
    $("html, body").animate
      scrollTop: 0
    , "slow"
    false


