// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require bootstrap
//= require rails-ujs
//= require turbolinks
//= require_tree .


/*
ModelName = 'operating';

var addRow = function(index) {

  var count_obj = $('#' + ModelName + '_' + index + '_count');
  var count = count_obj.val();

  // create row
  var row_name = getRowName(index, count);
  var tr_row =
   	'<tr id="' + row_name + '" class="sub_row">' +
      '<td style="cursor: default" onclick="removeRow(' + index + ',' + count + ')">' + 
      	'<div class="sub_col">' + 
      	  '-' +
      	  getDateHiddenFieldURL(index, count, 'year') +
      	  getDateHiddenFieldURL(index, count, 'month') +
      	  getDateHiddenFieldURL(index, count, 'day') +
      	'</div></td>' + 
	  '<td></td>' + 
	  '<td></td>' +
	  '<td>' + 
	  	'<div class="sub_col">' + getProjectsSelectBoxURL(index, count) + '</div>' +
	  '</td>' + 
      '<td>' +
        '<div class="sub_col">' + getTimeNumberFieldURL(index, count) + '</div>' +
      '</td>' +
      '<td>' + 
        '<div class="sub_col">' + getSummaryTextFieldURL(index, count) + '</div>' +
      '</td>' +
	  '<td></td>' +
	'</tr>';

  // insert row
  $('tr[id^=row_' + index + '_]:last').after(tr_row);
  count_obj.attr("value", ++count);

  // animation
  $('#' + row_name).animate({height: '1.5rem'});
  $('#' + row_name + ' .sub_col').animate({height: '1.5rem'});
}

var removeRow = function(index_a, index_b) {
	// animation
	var row_name = getRowName(index_a, index_b);
	$('#' + row_name + ' .sub_col').animate({height: '0'});
	$('#' + row_name).animate({height: '0'});

	setTimeout(function(){$('#' + row_name).remove();}, 300);
}

var clearRow = function(index) {
	// remove sub_row
	$('tr[id^=row_' + index + '_]:gt(0)').remove();

	var count_obj = $('#' + ModelName + '_' + index + '_count');
	count_obj.val(1);

	// clear input value
	var row_name = getRowName(index, 0);
	$('#' + row_name + ' select').val('');
	$('#' + row_name + ' input[type=number]').val('');
	$('#' + row_name + ' input[type=text]').val('');
}

var getRowName = function(index_a, index_b) {
	return 'row_' + index_a + '_' + index_b;
}

var getDateHiddenFieldURL = function(index_a, index_b, prop) {
	var id = getIdAttr(index_a, index_b, prop);
	var name = getNameAttr(index_a, index_b, prop);
	var value = $('#' + ModelName + '_' + index_a + '_0_' + prop).val();

	var hidden_field =
		'<input type="hidden" name="' + name + '" id="' + id + '" value="' + value + '">';
	return hidden_field;
}

var getProjectsSelectBoxURL = function(index_a, index_b) {
	var prop = 'project_id';
	var id = getIdAttr(index_a, index_b, prop);
	var name = getNameAttr(index_a, index_b, prop);

	var select_box = 
		'<select name="' + name + '" id="' + id + '">' +
		'<option value=""></option>';
	for(var i = 0; i < projects.length; i++) {
		select_box += '<option value="' + projects[i].id + '">' + projects[i].name + '</option>';
	}
	select_box += '</select>';
	return select_box;
}

var getTimeNumberFieldURL = function(index_a, index_b) {
	var prop = 'time';
	var id = getIdAttr(index_a, index_b, prop);
	var name = getNameAttr(index_a, index_b, prop);
	var class_name = 'input_time';

	var number_field =
		'<input type="number" name="' + name + '" id="' + id + 
		'" min="0" max="24" step="0.25" class="' + class_name + '">';
	return number_field;
}

var getSummaryTextFieldURL = function(index_a, index_b) {
	var prop = 'summary';
	var id = getIdAttr(index_a, index_b, prop);
	var name = getNameAttr(index_a, index_b, prop);
	var class_name = 'input_summary';
	
	var text_field =
		'<input type="number" name="' + name + '" id="' + id + '" class="' + class_name + '">';
	return text_field;
}

var getIdAttr = function(index_a, index_b, prop) {
	return ModelName + '_' + index_a + '_' + index_b + '_' + prop;
}

var getNameAttr = function(index_a, index_b, prop) {
	return ModelName + '[' + index_a + '][' + index_b + '][' + prop + ']';
}

*/


