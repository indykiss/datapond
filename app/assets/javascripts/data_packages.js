$(function(){
  $("a.load_documents").on("click", function(e){
    $.ajax({
      url: this.href,
      dataType: 'script'
    })
    e.preventDefault();
  })
})


$(function(){
  $("#new_document").on("submit", function(e){
    // 1. we need the URL to submit the POST request too
    // 2. we need the form data.
    $.ajax({
      type: ($("input[name='_method']").val() || this.method),
      url: this.action,
      data: $(this).serialize();, // either JSON or querystring serializing
      success: function(response){
        $("#document_content").val("");
        var $li = $("div.documents li")
        $li.append(response);

        
      }
    });
    e.preventDefault();
  })
});



// $(function() { 
//     $("a.load_docs").on("click", function(e) {
//         // fire ajax
//         // $.ajax({
//         //     method: "GET",
//         //     url: this.href    
//         //   }).done(function(response) {
//         //         // get response 
//         //         $("div.documents").html(response)
//         //         // load response to page 
//         //     });

//         $.get(this.href).success(function(response){
//             $("div.documents").html(response)
//         });

//         e.preventDefault();
//     });
// });