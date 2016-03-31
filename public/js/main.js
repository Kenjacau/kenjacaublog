$(function () {
    $('.tlt').textillate({
    
	in: { 
	effect:'wobble', 
	delay: 20,
	sequence: true,
    delayScale: 1.5,
    sync: false,
    shuffle: false,
  }

    });

    $('.tlt2').textillate({
	in: { 
	effect:'tada', 
	initialDelay: 4000,
    delayScale: 1.5,
    delay: 50,
    sync: false,
    shuffle: false,
  }

    });
})