
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


$(window).load(function () {

    $('.search-choice-close').click(function (e) {
        e.stopPropagation();
        var count = 0;
        $(this.parentElement.childNodes).each(function (i) {
            count++
            if (count == 1) {
                $('#' + this.innerText.replace(/ /g, 'Space')).remove();
            }
        });

    });

});

$(document).ready(function () {
    //$('.JQDate').datepicker(); //Date Only

    $('#AddNewCustomer').button().click(function (event) {

          event.preventDefault();
         

          var newCustomerName = $('#NewCustomerLead').val();
          var NewProject = $("#NewProject").val();
          var Address = $("#Address").val();
          var Quantity = $("#Quantity").val();

          $.ajax({
              url: "/Leads/LeadNewCustomer",
              type: "POST",
              dataType: "json",
              data: { NewCustomer: newCustomerName },
              success: function (data) {
                  

                  $('.chosenSelect').append("<option>" + newCustomerName + "</option>");


                  var options = $('.chosenSelect option');
                  var arr = options.map(function (_, o) {
                      return {
                          t: $(o).text(),
                          v: o.value
                      };
                  }).get();
                  arr.sort(function (o1, o2) {
                      return o1.t.toUpperCase() > o2.t.toUpperCase() ? 1 : o1.t.toUpperCase() < o2.t.toUpperCase() ? -1 : 0;
                  });
                  options.each(function (i, o) {
                      console.log(i);
                      o.value = arr[i].v;
                      $(o).text(arr[i].t);
                  });

                 $(".chosenSelect").trigger("chosen:updated");

                 $('#NewCustomerLead').text('');
                 $('#NewCustomerLead').val('New Customer Name ...');
                 $('#NewCustomerLead').attr('class', 'text-label');
                


                





                 $('input[type="text"]').each(function () {

                     if (window.location.href.toUpperCase().indexOf('EDIT') == -1) {

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

                 $("#NewProject").val(NewProject);
                 $("#Address").val(Address);
                 $("#Quantity").val(Quantity);


              }});

      });
              

    $('#theLeadCreateForm').on('submit', function () {
        // check validation

        if(1> $('.search-choice').length)
        {
            alert('Please select a Customer');
            return false;
        }

        
    });



    $('#PD').click(function () {

       
        var rowNum = 0;

        var totalRows = $('.row').length;

        $('.row').each(function () {

            var inputNum = 0;

            //Don't do for the hidden row on the page.
            if ((inputNum + 1) != totalRows) {

                $(this).children('input').each(function () {

                    var beginText = "[" + rowNum + "]";

                    if (inputNum == 0) {
                        $(this).val(rowNum);
                    }
                    if (inputNum == 1) {
                        $(this).attr("name", beginText + ".Customer");

                    }
                    if (inputNum == 2) {
                        $(this).attr("name", beginText + ".ContactEmail");
                    }
                    if (inputNum == 3) {
                        $(this).attr("name", beginText + ".ContactFirstname");
                    }
                    if (inputNum == 4) {
                        $(this).attr("name", beginText + ".ContactLastName");
                    }
                    if (inputNum == 5) {
                        $(this).attr("name", beginText + ".ContactMobile");
                    }
                    if (inputNum == 6) {
                        $(this).attr("name", beginText + ".ContactOfficePhone");
                    }

                    inputNum = inputNum + 1;
                });
            }

            rowNum = rowNum + 1;

        });
    });

   




    //Create Lead Page ...
    var id = 0;
    $("#addrow").click(function () {
        id++;
       // $('.samplerow div').html($('.samplerow div').html().replace(/xxx/g, "[1]"));
         var row = $('.samplerow div').clone(true);
      //  row.html(row.html().replace(/\[\]/g, "[1]"));
    
        row.attr('id', id);
        row.appendTo('#LeadContacts');

        return false;
    });

    $('.remove').on('click', function (event) {

        $(this).parents('div .row').remove();
        event.stopPropagation();
        return false;
     });
    //End Part of Lead Customer code


    $("#defaultLeadStatusId").prop('selectedIndex', 1);

    $(".chosenSelect").chosen();

   

    //This is where it chooses customer, cant tell if something is removed or added, will need to compare 2 arrays to check if its removed. dynamilcy pick out the div and remove it from the page
    //can google chosen and there are article
    
    $(".chosenSelect").chosen().change(function () {
       
        //Get All Currently Selected Customers after change.
        var selectedCustomers = $(".chosenSelect").val();

        //Get All Pre-Change Customers on page.
        var previousCustomers = [];

            $("#ContactZone div").each(function () {
                previousCustomers.push($(this).attr('id'));
        });

            var currentCustomerID;
            var clientName = [];
        try {
             
           
                $('.search-choice').each(function () {
                    clientName.push(this.outerText);
                    //clientName.push(this.value);
            });
                
            //currentCustomerID = $(this).val()[0];
                currentCustomerID = clientName[clientName.length - 1].replace(/ /g, 'Space');
            $(this).each( function (i, l) {
              //  alert(this.val());
            });
        } catch (e) {
           // currentCustomerID = $(this).val();
            currentCustomerID = clientName[clientName.length - 1].replace(/ /g, 'Space');
        }
      
        //COMPARE: selectedCustomers vs. previousCustomers.  If selected contains new add it.  If selected has one less remove it.
        //Pass this result into AJAX if add (not what is currently passed).  If remove then no ajax and just jquery to remove div).
        
        $('.search-choice-close').click(function (e) {
            e.stopPropagation();
            var count = 0;
             $(this.parentElement.childNodes).each(function (i) {

                 count++;
                 if (count ==1) {
                     $('#' + this.innerText.replace(/ /g, 'Space')).remove();
                 }
               
               
             
            });
           
        });

        //Set this ...
        var yesORno = true;
        if ($('#' + currentCustomerID).length) {
           
        } else {
            var NewTable = currentCustomerID.replace(/Space/g, '');
            var shorted = [];
            shorted.push(NewTable);
            var sv = clientName.sort(function(a,b){
                return a.toLowerCase().localeCompare(b.toLowerCase());
            }).slice();
            var valueInAray = jQuery.inArray(NewTable, sv);
            if (clientName.length ==1) {
                //just append
                $.ajax({
                    url: "/Leads/ShowContacts",
                    type: "POST",
                    dataType: "json",
                    data: { addItem: yesORno, theCustomerID: currentCustomerID },
                    success: function (data) {
                        $("#ContactZone").after(data);
                    }
                });
            }else
            if (sv[valueInAray+1] ==undefined) {
                //apend last value array
                $.ajax({
                    url: "/Leads/ShowContacts",
                    type: "POST",
                    dataType: "json",
                    data: { addItem: yesORno, theCustomerID: currentCustomerID },
                    success: function (data) {
                        $("#" + sv[sv.length - 2]).after(data);
                    }
                });
            } else if (clientName.length >= 1) {
                $.ajax({
                    url: "/Leads/ShowContacts",
                    type: "POST",
                    dataType: "json",
                    data: { addItem: yesORno, theCustomerID: currentCustomerID },
                    success: function (data) {
                        // $("#" + sv[valueInAray+1]).before(data);
                        $("#ContactZone").after(data);
                    }
                });
               
            } else {
                $.ajax({
                    url: "/Leads/ShowContacts",
                    type: "POST",
                    dataType: "json",
                    data: { addItem: yesORno, theCustomerID: currentCustomerID },
                    success: function (data) {
                         $("#" + sv[valueInAray+1]).before(data);
                       // $("#ContactZone").after(data);
                    }
                });
            }
           var appendBeforVal= sv[valueInAray];
            
        }

        
    });

    $('.JQDate').appendDtpicker({

        "dateFormat": "MM/DD/YYYY HH:mm TT",
        "amPmInTimeList": true,
        "autodateOnStart": false

    });


  
     

    $("#CreateCustomProjectCheckBox").click(function () {
        $("#NewProject").toggle();
        $('#NewProjectDropDown').toggle();
    });


    $("#NewCustomerLeadCheckBox").click(function () {
        $("#NewCustomerLead").toggle();
      //  $('#ExistingCustomerLeadDropDown').toggle();
    });



    var path = location.pathname;
    var theIndexOf = path.indexOf('Leads/Detail/');
    if(theIndexOf)
    {
        var reversed = path.split("").reverse().join();
        var number = reversed.replace(',', '').split('/')[0];
        number = number.split("").reverse().join().replace(/,/g, '');
        
        $('#LeadDetailLeadNotesIFRAME').attr('src', '/LeadNotes/Index/' + number);
       
       
    }

   
   

    $('#LeadField').change(function(){
  

        $('#FindByValue').val($('#FindByValue').attr('title'));

        if ($(this).val() == 'BidDue' || $(this).val() == 'BidOpening' || $(this).val() == 'Created' || $(this).val() == 'FollowUp')
        {
            $('#FindByValue').val("From Date");
            $('#FindByValue').appendDtpicker({

                "dateFormat": "DD/MM/YYYY HH:mm TT",
                "amPmInTimeList": true,
                "autodateOnStart": false

            });;
            $('#FindByValue2').show();
            $('#FindByValue2').val("To Date");


        }
        else
        {
         
            $('#FindByValue').appendDtpicker('destroy');
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
              $('#FindByValue').appendDtpicker({

                  "dateFormat": "DD/MM/YYYY HH:mm TT",
                  "amPmInTimeList": true,
                  "autodateOnStart": false

              });

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


       
       
           $(".ProjectAutoComplete3").autocomplete({
               source: function (request, response) {
                   $.ajax({
                       url: "/Projects/Index3",
                       type: "POST",
                       dataType: "json",
                       data: { Prefix: request.term },
                       success: function (data) {
                           response($.map(data, function (item) {
                               return { label: item.Number, value: item.Number };
                           }))

                       }
                   })
               },
               messages: {
                   noResults: "", results: ""
               }
           });
       

       $(".CustomerAutoComplete").autocomplete({
           source: function (request, response) {
               $.ajax({
                   url: "/Customers/Index2",
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

       $(".ContactAutoComplete").autocomplete({
           source: function (request, response) {
               $.ajax({
                   url: "/Contacts/Index2",
                   type: "POST",
                   dataType: "json",
                   data: { Prefix: request.term },
                   success: function (data) {
                       response($.map(data, function (item) {
                           return { label: item.Email, value: item.Email };
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
