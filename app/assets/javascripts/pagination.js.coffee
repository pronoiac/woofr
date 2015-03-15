jQuery ->
  if $('#infinite-scrolling').size() > 0
    $(window).on 'scroll', ->
      more_images_url = $('.pagination .next_page a').attr('href')
      if more_images_url && $(window).scrollTop() > 
        $(document).height() - $(window).height() - 300
          $('.pagination').html('<img src="/assets/ajax-loader.gif" \
            alt="Loading..." title="Loading..." />')
          $.getScript more_images_url
      return
    return