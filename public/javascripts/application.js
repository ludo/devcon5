// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults
function updateDashboard() {
  $.ajax({
    method: 'get',
    url : '/dashboard.js',
    dataType : 'text',
    success: function (text) { $('#dashboard').replaceWith(text); }
  });
}

var holdTheInterval = setInterval(updateDashboard, 5000);