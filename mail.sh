 #!/bin/bash

 team_name=$1
 server_ip=$2
 alert_type=$3
 message=$4
 to_address=$5
 subject=$6

final_message=$(echo "$message" | sed 's/[#$?!"&*()|<>` \t\\]/\\&/g')
final_body=$(sed -e "s/To_Team/$team_name/g" -e "s/ALERT_TYPE/$alert_type/g" -e "s/SERVER_IP/$server_ip/g" -e "s/MESSAGE_BODY/$final_message/g" template.html)
{
echo "To: $to_address"
echo "Subject: $subject"
echo "Content-Type: test/html"
echo ""
echo "$final_body"
} | msmtp "$to_address"
