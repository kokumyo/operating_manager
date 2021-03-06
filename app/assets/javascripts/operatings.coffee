# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/


MODEL = 'operating'

DEFAULT_TIME = '7.5'


$ ->
	$(document).on 'change', '#users', ->
		form = $('#form_for_user_selectbox')

		action = form.attr('action')
		action = action.substring(0, action.lastIndexOf('/') + 1) + $(this).val()
		form.attr('action', action)

		# submit
		form.submit()


	$(document).on 'click', 'div[id^=add_column]', ->
		# get index
		index = $(this).data('index')

		# get count
		counter = $(this).children('input[name=counter]')
		count = counter.val()

		# create row element
		row_name = getRowName(index, count)

		url_year	= getDateHiddenFieldURL(index, count, 'year')
		url_month	= getDateHiddenFieldURL(index, count, 'month')
		url_day		= getDateHiddenFieldURL(index, count, 'day')
		url_project = getProjectsSelectBoxURL(index, count)
		url_time	= getTimeNumberFieldURL(index, count)
		url_summary = getSummaryTextFieldURL(index, count)

		class_name = $(this).parent('td').parent('tr').attr('class')

		tr_row = """
		<tr id='#{row_name}' class='sub_row #{class_name}'>
			<td>
				<div id='rm_column_#{index}_#{count}' class='div_btn sub_col' data-index='#{index}_#{count}'>
					-
					#{url_year}#{url_month}#{url_day}
				</div>
			</td>
			<td></td>
			<td></td>
			<td><div class='sub_col'>#{url_project}</div></td>
			<td><div class='sub_col'>#{url_time}</div></td>
			<td><div class='sub_col'>#{url_summary}</div></td>
			<td></td>
		</tr>
		"""
#		console.log tr_row

		#insert row
		$("tr[id^=row_#{index}_]:last").after(tr_row)
		counter.val(++count)

		#animation
		$("##{row_name}").animate({height: '1.5rem'})
		$("##{row_name} .sub_col").animate({height: '1.5rem'})

		return


	$(document).on 'click', 'div[id^=rm_column]', ->

#		row_obj = $(this).parent('td').parent('tr')
#		alert row_obj.attr('id')

#		row_obj.find('.sub_col').animate({height: '0'})
#		row_obj.animate({height: '0'})

		index = $(this).data('index').split('_')
		row_name = getRowName(index[0], index[1])
		
		$("##{row_name} .sub_col").animate({height: '0'})
		$("##{row_name}").animate({height: '0'})

		setTimeout ->
			$("##{row_name}").remove()
		, 300

		return


	$(document).on 'click', 'button[id^=btn_clear]', ->
		row_obj = $(this).parent('td').parent('tr')

		row_id_sliced = row_obj.attr('id').slice(0, -1)
		row_obj.nextAll("tr[id^=#{row_id_sliced}]").remove()

		counter = row_obj.find('input[name=counter]')
		counter.val(1)

		row_obj.find('select, input[type=text], input[type=number]').val('')

		return


	$(document).on 'change', 'select[id$=project_id]', ->
		if $(this).val()
			id_time = $(this).attr('id').replace('project_id', 'time')
			if !$("##{id_time}").val()
				$("##{id_time}").val(DEFAULT_TIME)
		else
			row_obj = $(this).parents('tr[id^=row]')
			row_obj.find('input[type=text], input[type=number]').val('')




	$(document).on 'focus', 'input[id$=summary]', ->
		$('#summary_list').empty()
		id_project = $(this).attr('id').replace('summary', 'project_id')
		value = $("##{id_project}").val()

		if value
			summarys = new Set
			$("select option:selected[value=#{value}]").each ->
				id_summary = $(this).parent().attr('id').replace('project_id', 'summary')
				summary = $("##{id_summary}").val()
				if summary
					summarys.add(summary)

			
			summarys.forEach (summary) ->
				$('#summary_list').append("<option value='#{summary}'>")




	getRowName = (index_a, index_b) ->
		"row_#{index_a}_#{index_b}"

	getDateHiddenFieldURL = (index_a, index_b, prop) ->
		id = getIdAttr(index_a, index_b, prop)
		name = getNameAttr(index_a, index_b, prop)
		value = $("##{MODEL}_#{index_a}_0_#{prop}").val()

		"<input type='hidden' name='#{name}' id='#{id}' value='#{value}'>"

	getProjectsSelectBoxURL = (index_a, index_b) ->
		prop = 'project_id'
		id = getIdAttr(index_a, index_b, prop)
		name = getNameAttr(index_a, index_b, prop)

		select_box = "<select name='#{name}' id='#{id}'><option value=''></option>"
		for project in projects
			select_box += "<option value='#{project.id}'>#{project.name}</option>"
		select_box += "</select>"

	getTimeNumberFieldURL = (index_a, index_b) ->
		prop = 'time'
		id = getIdAttr(index_a, index_b, prop)
		name = getNameAttr(index_a, index_b, prop)
		class_name = 'input_time'

		"<input type='number' name='#{name}' id='#{id}' min=0 max=24 step=0.25 class='#{class_name}'>"


	getSummaryTextFieldURL = (index_a, index_b) ->
		prop = 'summary'
		id = getIdAttr(index_a, index_b, prop)
		name = getNameAttr(index_a, index_b, prop)
		class_name = 'input_summary'
		list = 'summary_list'
	
		"<input type='text' name='#{name}' id='#{id}' class='#{class_name}' list='#{list}' autocomplete='off'>"

	getIdAttr = (index_a, index_b, prop) ->
		MODEL + '_' + index_a + '_' + index_b + '_' + prop

	getNameAttr = (index_a, index_b, prop) ->
		MODEL + '[' + index_a + '][' + index_b + '][' + prop + ']'

