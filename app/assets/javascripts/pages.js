$(function() {
$('.load-more-button').click(function () {
  alert('loadmoarposts!');
   dataPost();
});


function dataPost(){
   $.post( "pages/load_more_posts", { highestId: findHighestId() }, function(data, status) {
   if(status == 'success') {
      
   }
   else {
   alert('Error!');
   }
});
}


function findHighestId(){
   var highest = 10000, current_id;
   $(".post-item").each( function()
   {
      current_id = parseInt($(this,10).attr('data-id'));
      if (current_id < highest)
      {
         highest = current_id;
      }
   });
   return highest;
}
});