// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"

// //book search feature
// $(document).ready(function() {

//     $("#myform").submit(function() {
//         var search = $("#books").val();

//         if(search == " ") {
//             alert("Please enter something in the field")
//         }
//         else {
//             var url = " ";
//             var img = " "; 
//             var title = " ";
//             var author = " ";
//             //jQuery
//             $.get("https://www.googleapis.com/books/v1/volumes?q=" + search,function(response){})
//                for(i = 0; i < response.items.length; i++) {
//                 //get title of the book, create html/JS forms of the info 
//                 title = $('<h5 class="center-align white-text">' + response.items[i].volumeInfo.title + '</h5>');
//                     //authors is an array 
//                 author = $('<h5 class="center-align white-text">' + response.items[i].volumeInfo.authors + '</h5>');
//                     //aligning is the class name, converting to card class
//                     //infoLink is the read more 
//                 img = $('<img class="aligning card z=depth-5" id="dynamic"><br><a href=' + response.items[i].volumeInfo.infoLink + '><button id= "imagebutton" class="btn red aligning">Read More</button></a>');
                
//                 url = response.items[i].volumeInfo.imageLinks.thumbnail;

//                 img.attr("src", url); //attach image url

//                 title.appendTo("#result");
//                 author.appendTo("#result");
//                 img.appendTo("#result");
//                }
//         }
//     })
//     return false;
// });