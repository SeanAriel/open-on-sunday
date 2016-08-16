$(document).ready(function(){
  $('#search_term, #city').on('keyup', function(){
    updateBarProgress();
  })
});

function updateBarProgress(){
  if ($('#search_term').val() == '' &&  $('#city').val() == '') {
    $('.progress-bar').text('0%');
  } else if ($('#search_term').val() != '' &&  $('#city').val() != ''){
    $('.progress-bar').text('100%');
  } else if ($('#search_term').val() != '' ||  $('#city').val() != '') {
    $('.progress-bar').text('50%');
  }
};
