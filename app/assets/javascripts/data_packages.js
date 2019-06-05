$(() => {
  bindClickHandlers()
})

const bindClickHandlers = () =>  {
  $('.all_data_packages').on('click', function(e){
    e.preventDefault()
    getDataPackages()
    showDataPackage()
    newDataPack()
  })
}

const getDataPackages = () => {
  history.replaceState(null, null, "data_packages")
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
}

const newDataPack = () => {
   $("form").submit(function(event) {
     // I work: but try something else $(document).on('click', ".new_data_package", function(e) {
     event.preventDefault();
     var values = $(this).serialize();
     var posting = $.post('/data_packages', values);
     posting.done(function(data) {
       var data_pack = data;
       $("#postName").text(data_pack["name"]);
       $("#postCategory").text(data_pack["category"]);
     });
   });
}

const showDataPackage = () => {
$(document).on('click', ".show_data_pack", function(e) {
  e.preventDefault()
  let id = $(this).attr('data-id')
  history.replaceState(null, null, "data_packages/" + id)

  fetch(`/data_packages/${id}.json`)
    .then(res => res.json())
    .then(data_package => {
      $("#app-container").html('')
      let newDataPackage = new DataPackage(data_package)
      let postHTML = newDataPackage.formatShow()
      $('#app-container').append(postHTML)
    })
  })
}

// I am a constructor function: like initialize, minus persistence, makes model object
function DataPackage(datapackage) {
  this.id = datapackage.id
  this.name = datapackage.name 
  this.category = datapackage.category 
  this.documents = datapackage.documents
  this.favorites = datapackage.favorites 
}

function Document(document) {
  this.id = document.id
  this.name = document.name
  this.raw_data = document.raw_data 
}

// I am a prototype 
DataPackage.prototype.formatIndex = function() {
  let postHTML = `
  <br><h4>
  <a href= "/data_packages/${this.id}" data-id = "${this.id}" 
  class = "show_data_pack"><h4>${this.name}</h4></a>
  <h6>
  Category: <a href = "categories/${this.category.id}">${this.category.name}</a>  </h6>
  <br>
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
    
Document.prototype.formatNew = function() {
    let postHTML = `
    <br>
    <h4> ${this.name}<br>
    ${this.raw_data} class = "new_data_pack">
    </h4>
    `
    return postHTML
  }



// Failed attempts to get newDataPackage() to work 

//    $("form").submit(function(event) {
//      event.preventDefault()
     
// 	    var values = $(this).serialize();
  
//        $.post('/data_packages/new', values)
//               .done(function(data) {
//   //           // json data is in data 
//   //           //   console.log(data)
//                 $("#app-container").html('')
//                const newDataPackage2 = new DataPackage(data)
//                const postHTML = newDataPackage2.formatNew() 
//                // not really appending
//                 $("#app-container").append(postHTML)
//              }) 
//    })
// }

  // const newDataPack = () => {
  //   $("form").submit(function (e) {
  //     e.preventDefault()
  //     // New problem:
  //     // the app only loads json after creating 
  //     // new document (nested under data package)
  //     // need to fix that
  //     let data_pack_id = parseInt($(".newDataPack").attr("data-id"));
  //     const values = $(this).serialize()

  //   //  history.replaceState(null, null, "data_packages/" + "data_pack_id")
  //     // hits create action on line 20 
  //      $.post('/data_packages/new', values)
  //        .done(function(data) {
  //       // json data is in data 
  //       //   console.log(data)
  //          $("#app-container").html('')
  //         const newDataPackage2 = new DataPackage(data)
  //         const postHTML = newDataPackage2.formatNew() 
  //         // not really appending
  //          $("#app-container").append(postHTML)
  //        })
  //     })
  // }
