console.log("hello")

var Forms = {

  clearErrors: function() {
    $("#errors").text("");
  },

  postAnswer: function(e, raosponse) {

    $(".answers").append(raosponse);
    this.reset();
    Forms.clearErrors();
  },

  postError: function(e, raosponse) {
    $("#errors").text(raosponse.responseJSON);
  },

  addAnswerListener: function() {
    $("#new_answer").on('ajax:success', this.postAnswer);
    $("#new_answer").on('ajax:error', this.postError);
  }
}



$(function() {
  Forms.addAnswerListener()
})

