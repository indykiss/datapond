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


const newDataPackage = () => {
  $("#new_data_package").on('submit', function(e) {
      e.preventDefault()
      var values = $(this).serialize();

      var posting = $.post('/data_packages/new', values);
        posting.done(function(data) {
          data_pack = new DataPackage(data)
          $("#postName").text(data_pack.name);
    });
  })
} 

// I'm working on how to add the "see has_many" test
// Going to add see a data package's documents on show page
// Down here. But not sure how
// I have gotten nowhere. Tried making a new prototype
// then add to this but :(
// time to look at other sources

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
//      let postHTMLDocs = newDataPackage.formatHasMany()
      $('#app-container').append(postHTML)
//      $('#app-container').append(postHTMLDocs)
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
  <h4> ${this.name} <br>
  <a href= "/data_packages/new" 
  class = "new_data_pack"><h4>Add a new data package</h4></a>
  </h4><br>
  <h5>
  Click to see the documents for this data package:<br>
  ${this.documents[0].name}
  </h5>
  `
  return postHTML
}

DataPackage.prototype.formatHasMany = function(obj) {
  var documents = this.documents;
  var postHTMLDocs = []

    var doc;
    for (doc = 0; doc < documents.length; doc++) {
      postHTMLDOCS < doc.name;
  }

}
    
Document.prototype.formatNew = function() {
    let postHTML = `
    <br> You created this data package:
    <h4> ${this.name}<br>
    </h4>
    `
    return postHTML
  }
