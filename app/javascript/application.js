// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails


$(document).ready(function(){
    
   $(".update").on("submit", function(e) {
    $.ajax({
        url: $(this).attr('action'),
        data: $(this).serialize(),
        type: "POST",
        dataType: "json",
        success: function(response) {
            console.log(response);
            alert("Form Updated successfully");
        },
        error: function(xhr, textStatus, errorThrown) {}
    });
    e.preventDefault(); 
});

});
