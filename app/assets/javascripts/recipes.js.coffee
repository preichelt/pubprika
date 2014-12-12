ready = ->
  recipes = new Bloodhound(
    datumTokenizer: Bloodhound.tokenizers.obj.whitespace("value")
    queryTokenizer: Bloodhound.tokenizers.whitespace
    prefetch: "/recipes.json"
    remote: "/recipes.json?r=no&q=%QUERY"
  )
  recipes.initialize()
  $(".typeahead").typeahead null,
    name: "q"
    displayKey: "name"
    source: recipes.ttAdapter()

  $(".note-content").each (i) ->
    $(this).html(urlize($(this).html(), {nofollow: true, autoescape: true}))

$(document).ready ready
$(document).on "page:load", ready
