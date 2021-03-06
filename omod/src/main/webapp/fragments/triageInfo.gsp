<%
	import java.text.DecimalFormat
    def formatter = new DecimalFormat("#0.00")
	
    def returnUrl = ui.pageLink("patientdashboardapp", "main", [patientId: patientId, opdId: opdId, queueId: queueId])
	ui.includeCss("registration", "onepcssgrid.css")
%>

<script>
	jq(document).ready(function () {
		jq('#vistdate').html(moment('${previousVisit}').format('DD MMM YYYY')+'<br/> &nbsp; &nbsp; (Active since '+moment('${previousVisit}').format('hh:mm')+' hrs)');    
		jq('#lastPeriods').text(jq('#lastPeriods').text().substring(0, 11).replaceAt(2, ",").replaceAt(6, " ").insertAt(3, 0, " "));
	});
</script>

<style>
	.donotprint {
		display: none;
	}

	.spacer {

		font-family: "Dot Matrix Normal", Arial, Helvetica, sans-serif;
		font-style: normal;
		font-size: 12px;
	}

	.printfont {
		font-family: "Dot Matrix Normal", Arial, Helvetica, sans-serif;
		font-style: normal;
		font-size: 12px;
	}

	.new-patient-header .identifiers {
		padding-top: 15px;
	}

	ul.left-menu {
		border-color: #ccc #ccc #ccc -moz-use-text-color;
		border-image: none;
		border-style: solid solid solid solid;
		border-width: 1px 1px 1px medium;
	}

	.dashboard .info-body label {
		width: 170px;
		display: inline-block;
		margin-bottom: 5px;
		font-size: 90%;
		font-weight: bold;
	}

	.checks {
		width: 140px !important;
		margin-bottom: 0px !important;
		font-size: 100% !important;
		font-weight: normal !important;
		cursor: pointer;
	}

	input[type="radio"] {
		cursor: pointer;
	}

	.dashboard .action-section {
		margin-top: 35px;
	}

	input[type="text"], input[type="password"], select {
		border: 1px solid #888;
		border-radius: 3px !important;
		box-shadow: none !important;
		box-sizing: border-box !important;
		height: 32px !important;
		line-height: 18px !important;
		padding: 0px 10px !important;
	}

	#fileNumberRow {
		margin: 2px 0px 10px 0px;
	}

	.status-container {
		padding: 5px 10px 5px 5px;
	}

	.button {
		height: 25px;
		width: 150px !important;
		text-align: center;
		padding-top: 15px !important;
	}

	.toast-item {
		background-color: #222;
	}

	.red-border {
		border: 1px solid #f00 !important;
	}
	.info-body .status.active {
		margin-right: 10px;
	}
	.menu-title a{
		text-decoration: none;
	}
</style>


<div class="onerow">
	<div style="padding-top: 15px;" class="col15 clear">
		<ul id="left-menu" class="left-menu">
			<li class="menu-item selected" visitid="54">
				<span class="menu-date">
					<i class="icon-time"></i>
					<span id="vistdate">2 Mar 2017<br> &nbsp; &nbsp; (Active since 04:10 PM)</span>
				</span>
				
				<span class="menu-title" style="height: 30px">
					<i class="icon-edit" style="float: left; margin-top: 1px; margin-right: 3px; color: rgb(0, 127, 255);"></i>
					<a style="float: left;" href="${ ui.pageLink('patientdashboardapp', 'triage', [patientId: patientId, opdId: opdId, queueId: queueId, returnUrl: returnUrl]) }">Edit Triage Details</a>
				</span>
				<span class="arrow-border"></span>
				<span class="arrow"></span>
			</li>
		
			<li style="height: 269px;" class="menu-item" visitid="53">
			</li>
		</ul>	
	</div>
	
	<div class="col16 dashboard">
		<div class="info-section">
			<div class="info-header">
				<i class="icon-diagnosis"></i>
				<h3>TRIAGE INFORMATION</h3>
			</div>
			
			<div class="info-body">
                <label><span class="status active"></span>Temperature:</label>
                <span>${triage?.temperature?:"Not Captured"}</span>
                <br>

                <label><span class="status active"></span>Blood Pressure:</label>
                <span>${ triage?.systolic && triage?.daistolic ? triage?.systolic + "/" + triage?.daistolic : "Not captured" }</span>
                <br>

                <label><span class="status active"></span>Respiratory Rate:</label>
                <span>${triage?.respiratoryRate?:"Not Captured"}</span>
                <br>
				
				<label><span class="status active"></span>Pulse Rate:</label>
                <span>${triage?.pulsRate?:"Not Captured"}</span>
                <br>

                <% if (patient.gender == "F" && patient.age > 10) {%>
                    <label><span class="status active"></span>Last Periods:</label>
                    <span id="lastPeriods">${ui.formatDatePretty(triage?.lastMenstrualDate) ?: "Not captured"}</span>
                    <br>
                <% } %>

                <label><span class="status active"></span>Oxygen Saturation:</label>
                <span>${triage?.oxygenSaturation? triage.oxygenSaturation.toString() + "%": "Not captured"}</span>
                <br>

				<label><span class="status active"></span>Height:</label>
				<span>${triage?.height?:"Not Captured"}</span>
				<br>
				
				<label><span class="status active"></span>Weight:</label>
				<span>${triage?.weight?:"Not Captured"}</span>
				<br>
				
				<% if (patient.age >= 2)  {%>
					<label><span class="status active"></span>BMI:</label>
					<span>${(triage && triage.weight && triage.height) ? formatter.format(triage?.weight/((triage?.height/100) * (triage?.height/100))) : "N/A" }</span>
					<br>
				<% } %>
				
				<label><span class="status active"></span>M.U.A Circum:</label>
				<span>${triage?.mua?:"Not Captured"}</span>
				<br>
				
				<label><span class="status active"></span>Chest Circum:</label>
				<span>${triage?.chest?:"Not Captured"}</span>
				<br>
				
				<label><span class="status active"></span>Abdominal Circum:</label>
				<span>${triage?.abdominal?:"Not Captured"}</span>
				<br>
				

				<label><span class="status active"></span>Blood Group:</label>
				<span>${triage?.bloodGroup && triage?.rhesusFactor ? triage?.bloodGroup + "/" + triage?.rhesusFactor : "Not captured"}</span>
				<br>
				
				<label><span class="status active"></span>HIV Status:</label>
				<span>${triage?.pitct ?: "Not Captured"}</span>
				<br>
			</div>
		</div>
	</div>
</div>


<div class="clear">&nbsp; </div>


