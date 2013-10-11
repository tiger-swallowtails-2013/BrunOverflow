var test = function() {
  console.log("hello world")
}
$.ajax({
  url: 'new_answer',
  type: "POST",
  success: test()
})
