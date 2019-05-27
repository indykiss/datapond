$(() => {
  bindClickHandlersDataPackages()
})

const bindClickHandlersDataPackages = () =>  {
  $('.all_data_packages').on('click', function(e){
    e.preventDefault()
    history.pushState(null, null, "data_packages")
    getDataPackages()
  })

const getDataPackages = () => 
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

$(document).on('click', ".show_data_pack", function(e) {
  e.preventDefault()
  let id = $(this).attr('data-id')
  history.pushState(null, null, "data_packages/${id}")
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
