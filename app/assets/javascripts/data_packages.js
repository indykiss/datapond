// Commenting out the below to fix:
// 1. The Jquery frankenstein thing 
// 2. The second object being created randomly

// $(() => {
//   bindClickHandlers()
// })

// const bindClickHandlers = () =>  {
//   $('.all_data_packages').on('click', function(e){
//     e.preventDefault()
//     getDataPackages()    
//     showDataPackage()
//   })

//   $('.all_data_packages_A_Z').on('click', function(e){
//     e.preventDefault()
//     getAlphabetizedDataPackages()
//   })

//   $('#new_data_package').on('click', function(e){
//     newDataPackage()
//   })
// }

const getAlphabetizedDataPackages = () => {
  history.replaceState(null, null, "data_packages/alphabetized")
  fetch(`/data_packages.json`)
  .then(res => res.json())
  .then(data_packages => {
    $("#app-container").html("")

    data_packages.sort(function(a, b) {
      var nameA = a.name.toUpperCase(); // ignore upper and lowercase
      var nameB = b.name.toUpperCase(); // ignore upper and lowercase
      if (nameA < nameB) {
        return -1;
      }
      if (nameA > nameB) {
        return 1;
      }
      // names must be equal
      return 0;
    });

    // alphabetize before the loop
    data_packages.forEach((pack) => {
      let newDataPackage = new DataPackage(pack)
      let postHTML = newDataPackage.formatIndex()
      $('#app-container').append(postHTML)
    })
  })
}

// Fetches all the data packages
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

// 
const newDataPackage = () => {
  $("#new_data_package").on('submit', function(e) {
      e.preventDefault()
      var values = $(this).serialize();

      var posting = $.post('/data_packages/new', values);
        posting.done(function(data) {
          data_pack = new DataPackage(data)
          $("#postName").text(data_pack.name);
          $("#postCategory").text(data_pack.category);          
    });
  })
} 

// Fetches the specific data package when requested
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
// DATABASE IS LOCKED, FIX ME
// Here is where I need to adjust to get rid of JQUERY?
// Need to think about the interaction between JQuery and the Ruby

// Looks like new category is working perfectly fine
// SO just figure out how to take off this Jquery thing
// Look at project lesson
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
  // hardcode, not great
  let postHTML = `
  <br>
  <h4> ${this.name} <br>
  <a href= "/data_packages/new" 
  class = "new_data_pack"><h4>Add a new data package</h4></a>
  </h4><br>
  <h5><br>
  The documents belonging to this data package:<br>
  ${this.documents[0].name}<br>
  ${this.documents[1].name}<br>
  ${this.documents[2].name}<br>
  </h5>
  `
  return postHTML
}

Document.prototype.formatNew = function() {
    let postHTML = `
    <br> You created this data package:
    <h4> ${this.name}<br>
    </h4>
    `
    return postHTML
  }






// figuring out how to loop through this.documents
// and console.log them. That's it

// DataPackage.prototype.formatHasMany = function(obj) {
  //   var documents = this.documents;
  //   let postHTMLDocs = "<h4> </h4>"

  //   documents.forEach(function (arrayItem) {
  //     var x = arrayItem.prop1 + 2;
  //     x
  // });

  //   let documents = this.documents;
  //   documents.forEach(function(element) {
  //     console.log(element);
  //   });

  // var postHTMLDocs = []
  //   var doc;
  //   for (doc = 0; doc < documents.length; doc++) {
  //     postHTMLDocs < doc.name;
  // }
// }