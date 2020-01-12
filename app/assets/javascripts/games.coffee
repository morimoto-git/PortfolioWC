# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$('.js-game')
  .on 'cocoon:before-insert', (e, rule_to_be_added) ->
    console.log('before insert')
    rule_to_be_added.fadeIn('slow')
  .on 'cocoon:after-insert', (e, added_rule) ->
    console.log('after insert')
    added_rule.css("background","red")
  .on 'cocoon:before-remove', (e, rule_to_be_removed) ->
    console.log('before remove')
    rule_to_be_removed.fadeOut('slow')
  .on 'cocoon:after-remove', (e, removed_rule) ->
    console.log('after remove')