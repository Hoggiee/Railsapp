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
      var lowestId = $('.post-item').last().attr('data-id');
      return parseInt(lowestId, 10);
   }
});