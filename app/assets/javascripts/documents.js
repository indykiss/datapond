// $(() => {
//   bindClickHandlersDocs()
// })
  
// const bindClickHandlersDocs = () =>  {

//   // before assessment, listen again to 
//   // min 13:00+ for
//   // https://www.youtube.com/watch?v=Yd0nH9CWWfo&amp=&feature=youtu.be
//   $('.new_document').on('submit', function(e){
//     e.preventDefault()
//     // New problem:
//     // the app only loads json after creating 
//     // new document (nested under data package)
//     // need to fix that
//     const values = $(this).serialize()

//     // hits create action on line 20 
//      $.post('/documents', values)
//        .done(function(data) {
//       // json data is in data 
//       //   console.log(data)
//          $("#app-container").html('')

//         const newDoc = new Document(data)
//         const postHTML = newDoc.formatNew() 
//         // not really appending
//          $("#app-container").append(postHTML)
//        })
//   })
  
//   // I am a model object
//   function Document(document) {
//     this.id = document.id
//     this.name = document.name
//     this.raw_data = document.raw_data 
//   }
  
//   // I am a prototype 
//   Document.prototype.formatNew = function() {
//     let postHTML = `
//     <br>
//     <h4> ${this.name}<br>
//     ${this.raw_data} 
//     </h4>
//     `
//     return postHTML
//   }
  
 
  