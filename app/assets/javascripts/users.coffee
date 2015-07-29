$(document).on "page:change", ->
	$('#general-link').click ->
		$('.box-container-main').toggle()
		$('.box-container1').hide()
		$('.box-container2').hide()

$(document).on "page:change", ->
	$('#location-link').click ->
		$('.box-container1').toggle()
		$('.box-container-main').hide()
		$('.box-container2').hide()

$(document).on "page:change", -> 
	$('#wishlist-link').click ->
		$('.box-container2').toggle()
		$('.box-container-main').hide()
		$('.box-container1').hide()