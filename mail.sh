 #!/bin/bash

#  team_name=$1
#  server_ip=$2
#  alert_type=$3
#  message=$4
#  to_address=$5
#  subject=$6

# final_message=$(echo "$message" | sed 's/[.|$*^\\\/]/\\&/g')
# final_body=$(sed -e "s/TO_TEAM/$team_name/g" -e "s/ALERT_TYPE/$alert_type/g" -e "s/SERVER_IP/$server_ip/g" -e "s/MESSAGE_BODY/$final_message/g" template.html)
# {
# echo "To: $to_address"
# echo "Subject: $subject"
# echo "Content-Type: test/html"
# echo ""
# echo "$final_body"
# } | msmtp "$to_address" 

#!/bin/bash

team_name=$1
server_ip=$2
alert_type=$3
message=$4
to_address=$5
subject=$6

{
    printf 'To: %s\n' "$to_address"
    printf 'Subject: %s\n' "$subject"
    printf 'MIME-Version: 1.0\n'
    printf 'Content-Type: text/html; charset=UTF-8\n'
    printf '\n'

    cat <<EOF
<p>Hi ${team_name},</p>
<p>This is an <strong>${alert_type}</strong> alert.</p>
<p>Server IP: ${server_ip}</p>
<p>${message}</p>
<p>Thanks &amp; Regards,<br>Monitoring Team</p>
EOF
} | msmtp "$to_address"
