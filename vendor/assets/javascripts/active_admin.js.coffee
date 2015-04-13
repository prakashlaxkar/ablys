#= require active_admin/base

$(document).ready ->
  $('.state_class').change ->
    val = $(this).val()
    $.ajax
      type: 'GET'
      url: '/users/get_cities'
      data: state: val
    return
  return
