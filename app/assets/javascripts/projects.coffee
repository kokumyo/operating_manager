# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
	$(document).on 'click', '#edit', ->
		edit_path = $('input[name=project_id]:checked').data('path') + '/edit'
		location.href = edit_path

	$(document).on 'click', '#delete', ->
		destroy_path = $('input[name=project_id]:checked').data('path')
		$(this).parent().attr('action', destroy_path)

	$(document).on 'click', '#up', ->
		radio = $('input[name=project_id]:checked')
		prev_tr = radio.parent().parent().prev()
		prev_id = prev_tr.children().children('input[name=project_id]').val()
		replace_path = radio.data('path') + "/replace?replaced_id=#{prev_id}"
		location.href = replace_path

	$(document).on 'click', '#down', ->
		radio = $('input[name=project_id]:checked')
		next_tr = radio.parent().parent().next()
		next_id = next_tr.children().children('input[name=project_id]').val()
		replace_path = radio.data('path') + "/replace?replaced_id=#{next_id}"
		location.href = replace_path



	$(document).on 'change', 'input[name=project_id]', ->
		radio = $('input[name=project_id]:checked')
		if radio.length 
			$('button').prop('disabled', false)

			tr = radio.parent().parent()

			if tr.prev('tr').length == 0
				$('#up').prop('disabled', true)
			if tr.next('tr').length == 0
				$('#down').prop('disabled', true)


#	if !($('input[name=project_id]:checked').length)
#		$('button').prop('disabled', true)

#	$('#projects table tbody').sortable
#		helper: (ev, ui) ->
#			ui.children().each ->
#				$(this).width($(this).width())
#			return ui

#		update: (ev, ui) ->
#			console.log ui.item.children().children('input[name=project_id]')
#			$('#form_projects').submit()


