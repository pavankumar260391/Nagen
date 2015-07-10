function updateEmployee(){
	var sendMonth = $('#attdDate').val();
	var myForm = $("#employeeForm").serialize();
	ajaxCallForUpdateEmployee(myForm,"updateEmployee",sendMonth);
}

function tableProcessing(data){
	
	$('#employeeTable').empty();
	var months = {1:"January", 2:"February", 3:"March", 4:"April", 5:"May", 6:"June", 7:"July", 8:"August", 9:"September", 10:"October", 11:"November", 12:"December" };
    var trHTML ="";
    var inStatusCount = 0;
	var outStatusCount = 0;
    trHTML += "<tr height=\"25px\" style=\"color:black; background-color: #F1F1F1; vertical-align: middle;\" align=\"center\"> <td width=\"10px\"><b>SNO.</b></td><td width=\"250px\"><b>Att Date</b></td><td><b>In Time</b></td><td><b>Out Time</b></td><td><b>In Status</b></td><td><b>Out Status</b></td><td><b>Status</b></td><td><b>Present</b></td><td></td></tr>";
    
    $.each(data, function (i, item) {
    	var counter = 0;
    	var instatus = $.trim(item.intimestatus);
    	var outstatus = $.trim(item.outtimestatus);    	        	
    	var parsedDate = new Date(parseInt(item.cdate));
    	var month = parsedDate.getMonth() + 1;
    	var day = parsedDate.getDate();
    	var year = parsedDate.getFullYear();
    	var date = day + "-" + month + "-" + year;
    	
    	if(instatus == "Late"){
    		inStatusCount += 1;
    		instatus = '<td class="data'+(counter+4)+'" style="background-color: rgb(226, 65, 65);">' + item.intimestatus +'</td>';    		
    	}else{
    		instatus = '<td class="data'+(counter+4)+'" style="background-color: rgb(255, 255, 255);">' + item.intimestatus +'</td>';    		
    	}
    	
    	if(outstatus == "Early"){
    		outStatusCount += 1;
    		outstatus= '<td class="data'+(counter+5)+'" style="background-color: rgb(216, 178, 26);">' + item.outtimestatus + '</td>';
    	}else{
    		outstatus= '<td class="data'+(counter+5)+'" style="background-color: rgb(255, 255, 255);">' + item.outtimestatus + '</td>';
    	}
    	
        trHTML += '<tr height="15px" id="resultDataRow'+i+'" style="color: black; vertical-align: middle;"><td class="data'+counter+'"><b>' + i + '.</b></td><td class="data'+(counter+1)+'">' + date + '</td><td class="data'+(counter+2)+'">' + item.intime + '</td><td class="data'+(counter+3)+'">' + item.outtime + '</td>'+instatus+''+outstatus+'<td class="data'+(counter+6)+'">' + item.status + '</td><td class="data'+(counter+7)+'">' + item.present + '</td><td class="data'+(counter+8)+'"><button id="btnId'+i+'" class="btn btn-primary" onClick="popupOpen(this.id)"><span class="glyphicon glyphicon-edit" aria-hidden="true"></span>Edit</button></td></tr>';
    });
    
    $('#employeeTable').append(trHTML);
    $('#dialog').attr('title', "Details for "+ months.selectedMonth);
    $('#montlylateInfo').show();
    $('#montlylateInfo').text('Total Late Arrival : '+inStatusCount+' | ');
    $('#montlyEarlyInfo').show();
    $('#montlyEarlyInfo').text(' Total Early Out : '+outStatusCount);
}

function deleteAttendus(){
	var sendMonth = $('#attdDate').val();
	$.ajax({    				
		url:contextPath+'/admin/deleteAttendus',		
		data:{"employeeName":selectedName,"attndDate": sendMonth},
		type:"get",
		success: function(data){
    		$("#dialog-form").dialog('close');    		
    		$('#updation-success').show();
    		$('#updation-success').text(data);
    		$(function() {
    		    $( "#dialog-success-message" ).dialog({
    		      /* open: function(event, ui) { $(".ui-dialog-titlebar-close").hide(); }, */
    		      modal: true,
    		      buttons: {
    		        Ok: function() {
    		          $( this ).dialog( "close" );
    		        }
    		      }
    		    });
    		  });	
    		var option = $('#monthSelect').find('option:selected').val();
    		ajaxCall(option,'retreiveEmployeeForAdminMonth',option);
		}    				
	});    
}

function ajaxCallForUpdateEmployee(formObject,controller,additionalInfo){
	$.ajax({
    	url:contextPath+"/admin/"+controller,	        	
    	type: "POST",
    	data:formObject+"&additionalInfo="+additionalInfo,
    	success: function(data){
    		$( "#dialog-form" ).dialog('close');    		
    		$('#updation-success').show();
    		$('#updation-success').text(data);
    		$(function() {
    		    $( "#dialog-success-message" ).dialog({
    		      /* open: function(event, ui) { $(".ui-dialog-titlebar-close").hide(); }, */
    		      modal: true,
    		      buttons: {
    		        Ok: function() {
    		          $( this ).dialog( "close" );
    		        }
    		      }
    		    });
    		  });
    		var option = $('#monthSelect').find('option:selected').val();
    		ajaxCall(option,'retreiveEmployeeForAdminMonth',option);
    	} });  
}

function ajaxCall(option,controller,selectedMonth){
	$.ajax({
    	url:contextPath+"/admin/"+controller,	        	
    	type: "POST",
    	data:{"requiredData":option},
    	success: function(data){
    		tableProcessing(data);
    	}});  
}


function popupOpen(rowId){	
	var resultRowId = $("#"+rowId).closest('tr').attr("id");
	$("#attdDate").val($("#"+resultRowId).children("td.data1").text());
	$("#inTime").val($("#"+resultRowId).children("td.data2").text());
	$("#outTime").val($("#"+resultRowId).children("td.data3").text());
	$('#inStatus option[value='+$("#"+resultRowId).children("td.data4").text()+']').prop('selected', true);	
	$('#outStatus option[value='+$("#"+resultRowId).children("td.data5").text()+']').prop('selected', true);
	$('#status option[value='+$("#"+resultRowId).children("td.data6").text()+']').prop('selected', true);	
	$('#present option[value='+$("#"+resultRowId).children("td.data7").text()+']').prop('selected', true);	
	$("#dialog-form").dialog("open");
}
