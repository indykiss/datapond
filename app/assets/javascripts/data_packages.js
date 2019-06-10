$(() => {
  bindClickHandlers()
})

const bindClickHandlers = () =>  {
  $('.all_data_packages').on('click', function(e){
    e.preventDefault()
    getDataPackages()    
    showDataPackage()
  })

  $('#new_data_package').on('click', function(e){
    newDataPackage()
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

// I'm not actually making an object anymore. Fix that
// I'm working on lines 41 - 46. Need to make the object
// use the prototype and constructor function 

const newDataPackage = () => {
  $("#new_data_package").on('submit', function(e) {
      e.preventDefault()
      var values = $(this).serialize();

      var posting = $.post('/data_packages/new', values);
        posting.done(function(data) {
         // $("#postName").text(data);

          data_pack = DataPackage.new(data)
          data_pack.formatShow();

        // $("#postName").text(data);
        //  $("#postName").text(data_pack["name"]);
        //  $("#postCategory").text(data_pack["category"]);
     });
   })
  } 

  // $("#new_data_package").on('submit', function(e) {
  //   //$("form").submit(function(event) {
  //    console.log("I WORK");
  //   let id = $(this).attr('data-id')
  //   fetch(`/data_packages/${id}.json`)
  //   .then(res => res.json())
  //   .then(data_package => {
  //     $("#app-container").html('')
  //     let newDataPack = new DataPackage(data_package)
  //     let postHTML = newDataPack.formatNew()
  //     $('#app-container').append(postHTML)
  //   })
  // })




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
  <h4> ${this.name} 
  <h4>
  <a href= "/data_packages/new" 
  class = "new_data_pack"><h4>Add a new data package</h4></a>
  </h4>
  `
  return postHTML
}
    
Document.prototype.formatNew = function() {
    let postHTML = `
    <br>
    <h4> ${this.name}<br>
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
