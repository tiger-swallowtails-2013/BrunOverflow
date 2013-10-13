var test = function() {
  console.log("hello world")
}

var postAndShowAnswer = function(e) {
  e.preventDefault();
  $.post("/answers", $( this ).serialize())
  .done(function(response) {
    $(".answers").append(response)
  });
};

var addAnswerListener = function() {
  $("#new_answer").on('submit', postAndShowAnswer)
}

$(function() {
  addAnswerListener()
})

