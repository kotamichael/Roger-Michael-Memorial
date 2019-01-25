$(".static_pages.home").ready ->

  ### VARIABLES ###

  scrolled = $(window).scrollTop()
  contentDepth = window.innerHeight * 2
  parallaxMarginTop = (window.innerHeight / -24)
  contentTop = (200 + parallaxMarginTop)

  ### FUNCTIONS ###

  parallaxScroll = ->
    $('.memoriam').css 'top', (window.innerHeight * 0.025) + (scrolled * 0.1) + 'vh'
    $('.parallax').css 'margin-top', parallaxMarginTop + 'vh'
    $('#parallax-bg3').css 'top', 0 - (scrolled * .75) + 'px'
    return

  parallaxNavTop = ->
    $('nav').css 'top', contentTop + 'vh'
    return

  parallaxBreakPoints = -> 
    if scrolled > (contentDepth * (1.38))
      $('nav').addClass 'fix-nav'
      $('nav').css 'top', 0

    else if scrolled < (contentDepth * 1.38)
      $('nav').removeClass 'fix-nav'
      # $('nav').css 'top', '200vh'
      $('.memoriam').css 'visibility', 'initial'

    if scrolled > contentDepth
      $('.memoriam').css 'visibility', 'hidden'

    else if scrolled < contentDepth
      $('.memoriam').css 'visibility', 'initial'
    return

  ### INITIAL SETUP ###

  parallaxScroll()
  parallaxNavTop()

  ### ON SCROLL ###

  $(window).on 'scroll', ->
    ###function variables###
    parallaxMarginTop = (window.innerHeight / -24) + (scrolled / (window.innerHeight / 90))
    contentTop = (200 + parallaxMarginTop)
    scrolled = $(window).scrollTop()
    contentDepth = window.innerHeight * 7

    ###function calls###
    $('.memoriam').css 'opacity', (contentTop * 2 / scrolled)
    $('.parallax').css 'opacity', ((300 + contentTop * 2) / scrolled)
    parallaxScroll()
    parallaxNavTop()
    parallaxBreakPoints()
  return

  $('a').on 'click', (event) ->
      # Make sure this.hash has a value before overriding default behavior
      if @hash != ''

        # Prevent default anchor click behavior
        event.preventDefault()

        # Store hash
        hash = @hash

        $('html, body').animate { scrollTop: $(hash).offset().top }, 10000, ->
          # Add hash (#) to URL when done scrolling (default click behavior)
          window.location.hash = hash
          return
      # End if
      return
return
