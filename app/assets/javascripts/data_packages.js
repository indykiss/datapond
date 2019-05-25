$(() => {
  bindClickHandlers()
})

const bindClickHandlers = () =>  {


  $('.all_data_packages').on('click', function(e){
    e.preventDefault()
    history.pushState(null, null, "data_packages")
    fetch(`/data_packages.json`)
    .then(res => res.json())
    .then(data_packages => {
      $("#app-container").html("")
      data_packages.forEach((pack) => {
        let newDataPackage = new DataPackage(pack)
        let postHTML = newDataPackage.formatIndex()
        $('#app-container').append(postHTML)
      })
    })
  })

$(document).on("click", ".show_data_pack", (e) => {
  e.preventDefault()
  let id = $(this).attr('data-id')
  fetch(`/data_packages/${id}.json`)
    .then(res => res.json())
    .then(data_packages => {
      let newDataPackage = new DataPackage(pack)
      let postHTML = newDataPackage.formatShow()
      $('#app-container').append(postHTML)
    })
  })

}

function DataPackage(datapackage) {
  this.id = datapackage.id
  this.name = datapackage.name 
  this.category = datapackage.category 
  this.documents = datapackage.documents
  this.favorites = datapackage.favorites 
}

DataPackage.prototype.formatIndex = function() {
  let postHTML = `
  <br>
  <a href= "/data_packages/${this.id}" data-id = "${this.id}" class = "show_data_pack"><h4>${this.name}</h4></a>
  `
  return postHTML
}

DataPackage.prototype.formatShow = function() {
  let postHTML = `
  <br>
  <h4> ${this.name} </h4>
  `
  return postHTML
}



// // $(function(){
// //   $("a.load_documents").on("click", function(e){
// //     $.ajax({
// //       url: this.href,
// //       dataType: 'script'
// //     })
// //     e.preventDefault();
// //   })
// // })


// // $(function(){
// //   $("#new_document").on("submit", function(e){
// //     // 1. we need the URL to submit the POST request too
// //     // 2. we need the form data.
// //     $.ajax({
// //       type: ($("input[name='_method']").val() || this.method),
// //       url: this.action,
// //       data: $(this).serialize();, // either JSON or querystring serializing
// //       success: function(response){
// //         $("#document_content").val("");
// //         var $li = $("div.documents li")
// //         $li.append(response);

        
// //       }
// //     });
// //     e.preventDefault();
// //   })
// // });


// $(function () {
// 	seeAllDocs()
//  })


// function seeAllDocs() {
//   $("form").submit(function (e) {
//      e.preventDefault()

//      let dataPackId = parseInt($(".dataPackName").attr("data-id"));
     
     
// 	   var values = $(this).serialize();
// 	   var posting = $.post('/data_packages/' + dataPackId + '/documents', values);
//      posting.done(function(data) {
//      let $div = $("#new-doc-response");
// 	   $div.append(data)    
// 	})
//   })
// }

// // // $(function() { 
// // //     $("a.load_docs").on("click", function(e) {
// // //         // fire ajax
// // //         // $.ajax({
// // //         //     method: "GET",
// // //         //     url: this.href    
// // //         //   }).done(function(response) {
// // //         //         // get response 
// // //         //         $("div.documents").html(response)
// // //         //         // load response to page 
// // //         //     });

// // //         $.get(this.href).success(function(response){
// // //             $("div.documents").html(response)
// // //         });

// // //         e.preventDefault();
// // //     });
// // // });