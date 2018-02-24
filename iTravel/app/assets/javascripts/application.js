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
//= require rails-ujs

//= require jquery
//= require jquery_ujs
//= require materialize-sprockets
//= require materialize
//= require turbolinks
//= require_tree .


$('.datepicker').pickadate({
  selectMonths: true, // Creates a dropdown to control month
  selectYears: 15, // Creates a dropdown of 15 years to control year,
  today: 'Today',
  clear: 'Clear',
  close: 'Ok',
  closeOnSelect: false // Close upon selecting a date,
});

$(document).ready(function(){
  $('.slider').slider({
      full_width: false,
      indicators: false,
  });
});


// indicators	Set to false to hide slide indicators. (Default: True)
// height	Set height of slider. (Default: 400)
// transition	Set the duration of the transition animation in ms. (Default: 500)
// interval	Set the duration between transitions in ms. (Default: 6000)
