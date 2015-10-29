var highest=0
$(function() {
$('.load-more-button').click(function () {
   var current_id;
   $(".post-item").each( function()
   {
      current_id = parseInt($(this,10).attr('data-id'));
      if (current_id > highest)
      {
         highest = current_id;
      }
   });
   dataPost();
});


function dataPost(){
   alert('datapossttt');
   $.post( "pages/load_more_posts", { highest_id: highest }, function(data, status) {
   if(status == 'success') {
   alert('datapost');
   $.append(data);
   }
   else {
   alert('Error!');
   }
});
}



});