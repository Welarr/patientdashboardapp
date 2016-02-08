<% ui.decorateWith("appui", "standardEmrPage") %>
<div class="patient-header new-patient-header">
    <div class="demographics">
        <h1 class="name">
            <span><small>${patient.names.givenName}</small>,<em>surname</em></span>
            <span><small>${patient.names.familyName} &nbsp;${(patient.middleName)?.replace(',', ' ')}</small><em>name</em>
            </span>
            <span><small>${patient.gender}</small>,<em>Gender</em></span>
            <span><small>${patient.age} year(s)</small><em>Age</em></span>

        </h1>

        <br>

        <div class="status-container">
            <span class="status active"></span>
            ${visitStatus}
        </div>

        <div class="tag">Outpatient (File Number :)</div>
    </div>

    <div class="identifiers">
        <em>Patient ID</em>
        <span>${patientIdentifier}</span>
        <em>Payment Category</em>
        <span>${category}</span>
    </div>

    <div class="identifiers">
        <em>Date/ Time:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</em>
        <span>${previousVisit}</span>

    </div>
    <div class="identifiers">
        <em>Location</em>
        <span>${patient.addresses.address1}</span>

    </div>
</div>

<div class="dashboard-tabs">
    <ul>
        <li><a href="#triage-info">Triage Information</a></li>
        <li><a href="#notes">Clinical Note</a></li>
        <li><a href="#summary">Clinical Summary</a></li>
    </ul>

    <div id="triage-info">
        ${ ui.includeFragment("patientdashboardapp", "triageInfo", [patientId: patientId, opdId: opdId, queueId: queueId]) }
    </div>

    <div id="notes">
        ${ ui.includeFragment("patientdashboardapp", "clinicalNotes", [patientId: patientId, opdId: opdId, queueId: queueId, opdLogId: opdLogId]) }
    </div>
    
    <div id="summary">
        ${ ui.includeFragment("patientdashboardapp", "visitSummary", [patientId: patientId]) }
    </div>
    
</div>

<script>
jq(function(){
    jq(".dashboard-tabs").tabs();
})
</script>
