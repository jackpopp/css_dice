final = 1
values = []
total = 1


rollDice = (dice) ->
	prev = final
	returnVal = Math.floor((Math.random()*6)+1) 
	interval = setInterval(
		->
			prev = final
			final = Math.floor((Math.random()*6)+1) 
			removeClasses(dice)
			$(dice).addClass('show-'+final)
			
		500
	)
	setTimeout(
		->
			clearInterval(interval)
			removeClasses(dice)
			$(dice).addClass('show-'+returnVal)
		3500
	)
	return returnVal

removeClasses = (dice) ->
	$(dice).removeClass('show-'+num) for num in [6...1]
	return

allTheDice = ->
	values = []
	$('.dice').each ->
		values.push rollDice($(this))
	total = values.reduce (a, b) -> a + b
	setTimeout(
		->
			$('.show-result').html "You rolled a #{total}"
		4000
	)
	return

addDice = ->
	dice = $('.dice-container').eq(0).clone()
	$('.dice-holder').append(dice)

$ ->
	$('.dice').click -> rollDice(this)
	$('.roll-dice').click -> allTheDice()
	$('.add-dice').click -> addDice()
	return