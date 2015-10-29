$(function() {
$('.load-more-button').click(function () {
   dataPost();
});


function dataPost(){
   $.post( "pages/load_more_posts", { highest_id: findHighestId() }, function(data, status) {
   if(status == 'success') {
   $('.posts-list').append(data);
   }
   else {
   alert('Error!');
   }
});
}


function findHighestId(){
   var highest = 0, current_id;
   $(".post-item").each(function()
   {
      current_id = parseInt($(this,10).attr('data-id'));
      if (current_id > highest)
      {
         highest = current_id;
      }
   });
   return highest;
}
});