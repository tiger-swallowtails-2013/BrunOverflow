var clearErrors = function() {
  $("#errors").text("")
}

var postAnswer = function(e, raosponse) {
  $(".answers").append(raosponse);
  this.reset();
  clearErrors()
}

var postError = function(e, raosponse) {
  $("#errors").text(raosponse.responseJSON)
}

var addAnswerListener = function() {
  $("#new_answer").on('ajax:success', postAnswer)
  $("#new_answer").on('ajax:error', postError)
}

$(function() {
  addAnswerListener()
})

