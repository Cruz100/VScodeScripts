# Gather system information

$TicketText = "Checked and maintained all MTRs to ensure reliability"

$TicketText | Set-Clipboard

Start-Process "https://jti.service-now.com/incident.do?sys_id=69be5d6787750f1cbf3285130cbb35a8&sysparm_record_target=task&sysparm_record_row=6&sysparm_record_rows=17&sysparm_record_list=active%3Dtrue%5Eassigned_to%3Djavascript%3AgetMyAssignments%28%29%5EORDERBYDESCactivity_due"
