$(document).ready(function(){
  $('#search_term, #city').on('keyup', function(){
    updateBarProgress();
  })
});

function updateBarProgress(){
  if ($('#search_term').val() == '' &&  $('#city').val() == '') {
    $('.progress-bar').text('0%');
    $('.progress-bar').css('width', '0%');
  } else if ($('#search_term').val() != '' &&  $('#city').val() != ''){
    $('.progress-bar').text('100%');
    $('.progress-bar').css('width', '100%');
  } else if ($('#search_term').val() != '' ||  $('#city').val() != '') {
    $('.progress-bar').text('50%');
    $('.progress-bar').css('width', '50%');
  }
};
