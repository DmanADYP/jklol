
function getParameterByName(name) {
    var regexS = "[\\?&]" + name + "=([^&#]*)",
  regex = new RegExp(regexS),
  results = regex.exec(window.location.search);
    if (results == null) {
        return "";
    } else {
        return decodeURIComponent(results[1].replace(/\+/g, " "));
    }
}

function getParameterByNameAndHref(name, href) {
    name = name.replace(/[\[]/, "\\\[").replace(/[\]]/, "\\\]");
    var regexS = "[\\?&]" + name + "=([^&#]*)";
    var regex = new RegExp(regexS);
    var results = regex.exec(href);
    if (results == null)
        return "";
    else
        return decodeURIComponent(results[1].replace(/\+/g, " "));
}


$(document).ready(function () {
    $('.JQDate').datepicker();

    var path = location.pathname;
   // alert(path);
    var theIndexOf = path.indexOf('Leads/Detail/');

       // var reversed = path.split("").reverse().join();
       // var number = reversed.split('/')[0].replace(',','');
        
        var reversed = path.split("").reverse().join();
        var number = reversed.replace(',', '').split('/')[0];
        number = number.split("").reverse().join().replace(/,/g, '');

        //Inside initial iFrame set Create to have id to know where to come back
        $('#CreateLeadNotes').attr('href', '/LeadNotes/Create/' + number);
          
        //Insite initial iFrame set all other links with ?Parent= so they know where to come back to
        $(".AppendParent").each(function () {

            var theURL = $(this).attr('href');
            $(this).attr('href', theURL + '?Parent=' + number)

        });

        $('.BackToParent').each(function () {

           // var theURL = $(this).attr('href');
            var theParent = getParameterByName('Parent');
            $(this).attr('href', '/LeadNotes/Index/' + theParent);

        });

      




        //Logic to update Edit, Delete, Details to have ?Parent= + number, get all a links and loop over and set each to what they are + the addition
        //Update controler to have ReturnId .....
        



   

    $('#LeadField').change(function(){
  

        $('#FindByValue').val($('#FindByValue').attr('title'));

        if ($(this).val() == 'BidDue' || $(this).val() == 'BidOpening' || $(this).val() == 'Created' || $(this).val() == 'FollowUp')
        {
            $('#FindByValue').val("From Date");
            $('#FindByValue').datepicker();
            $('#FindByValue2').show();
            $('#FindByValue2').val("To Date");


        }
        else
        {
         
            $('#FindByValue').datepicker('destroy');
            $('#FindByValue2').val("To Date");
            $('#FindByValue2').hide();
        }

        
        if (getParameterByName('LeadField')) {
            var theVal = getParameterByName('LeadField');
         
            //If the URL params match the selected choice
            if ($(this).val() == theVal)
            {

                if (getParameterByName('SearchStringValue')) {
                    $('#FindByValue').val(getParameterByName('SearchStringValue'));
                }
                if (getParameterByName('SearchStringValue2')) {
                    $('#FindByValue2').val(getParameterByName('SearchStringValue2'));
                }

            }

        }




        var theLeadField = $('#LeadField').val();

        $(".LeadAutoComplete").autocomplete({
            source: function (request, response) {
                $.ajax({
                    url: "/Leads/LeadAutoComplete",
                    type: "POST",
                    dataType: "json",
                    data: { Prefix: request.term, LeadField: theLeadField },
                    success: function (data) {
                        response($.map(data, function (item) {
                            return { label: item.Name, value: item.Name };
                        }))

                    }
                })
            },
            messages: {
                noResults: "", results: ""
            }
        });

        
        
    }); 

      if(getParameterByName('LeadField'))
      {
          var theVal =getParameterByName('LeadField');
          $('#LeadField').val(theVal);

          if (theVal == 'BidDue' || theVal == 'BidOpening' || theVal == 'Created' || theVal == 'FollowUp')
          {
              $('#FindByValue').val("From Date");
              $('#FindByValue').datepicker();
              $('#FindByValue2').show();
          }

          

          if (getParameterByName('SearchStringValue')) {
              $('#FindByValue').val(getParameterByName('SearchStringValue'));
          }
          if (getParameterByName('SearchStringValue2')) {
              $('#FindByValue2').val(getParameterByName('SearchStringValue2'));
          }



      }

    


});


   $(document).ready(function () {
       $(".ProjectAutoComplete").autocomplete({
           source: function (request, response) {
               $.ajax({
                   url: "/Projects/Index2",
                   type: "POST",
                   dataType: "json",
                   data: { Prefix: request.term },
                   success: function (data) {
                       response($.map(data, function (item) {
                           return { label: item.Name, value: item.Name };
                       }))

                   }
               })
           },
           messages: {
               noResults: "", results: ""
           }
       });


       var theLeadField = $('#LeadField').val();

       $(".LeadAutoComplete").autocomplete({
           source: function (request, response) {
               $.ajax({
                   url: "/Leads/LeadAutoComplete",
                   type: "POST",
                   dataType: "json",
                   data: { Prefix: request.term, LeadField: theLeadField },
                   success: function (data) {
                       response($.map(data, function (item) {
                           return { label: item.Name, value: item.Name };
                       }))

                   }
               })
           },
           messages: {
               noResults: "", results: ""
           }
       });

      

   })


   $('input[type="text"]').each(function () {

       if (window.location.href.toUpperCase().indexOf('EDIT') == -1)
           {

       this.value = $(this).attr('title');
       $(this).addClass('text-label');



       $(this).focus(function () {
           if (this.value == $(this).attr('title')) {
               this.value = '';
               $(this).removeClass('text-label');
           }
       });

       $(this).blur(function () {
           if (this.value == '') {
               this.value = $(this).attr('title');
               $(this).addClass('text-label');
           }
       });


   }
    
});

$('input[type="submit"]').click(function () {

    $('input[type="text"]').each(function () {

        if (this.value == $(this).attr('title')) {
            this.value = '';
            $(this).removeClass('text-label');
        }
    });

});
