$(function() {
   $('.load-more-button').click(function () {
      dataPost();
   });
   
   function dataPost(){
      $.post( "pages/load_more_posts", { lowest_id: findLowestId() }, function(data, status) {
      if(status == 'success') {
         $('.posts-list').append(data);
      }
      else {
         alert('Error!');
      }
   });
   }
   
   
   function findLowestId(){
      var current_id, lowest = 10000;
      $(".post-item").each(function()
      {
         current_id = parseInt($(this,10).attr('data-id'));
         if (current_id < lowest)
         {
            lowest = current_id;
         }
      });
      return lowest;
   }
});