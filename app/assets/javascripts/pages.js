$(function() {
    
$('.load-more-button').click(function () {
  alert('loadmoarposts!');
});

//find current ID jQuery

var highest = 0, current_id
$(".post-item").each( function()
{
   current_id = parseInt($(this,10).attr('data-id'));
   if (current_id > highest)
   {
      highest = current_id;
   }
});
console.log(highest);
alert(highest)


});