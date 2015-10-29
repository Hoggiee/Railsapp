$(function() {
$('.load-more-button').click(function () {
   var current_id, highest = 0;
   $(".post-item").each( function()
   {
      current_id = parseInt($(this,10).attr('data-id'));
      if (current_id < highest)
      {
         highest = current_id;
      }
   });
   dataPost();
});


function dataPost(){
   $.post( "pages/load_more_posts", { highest_id: highest }, function(data, status) {
   if(status == 'success') {
   $('#pages').append("<%= escape_javascript(render :layout=>false, :post => @posts  %>");
   }
   else {
   alert('Error!');
   }
});
}



});