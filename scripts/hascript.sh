echo "Starting at `date` \n"
setsebool -P haproxy_connect_any 1
firewall-cmd --zone=public --add-port=80/tcp --permanent
firewall-cmd --zone=public --add-port=443/tcp --permanent
firewall-cmd --reload
 
echo "Generating Self signed SSL cert \n"
openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/pki/tls/certs/sn.key -out /etc/pki/tls/certs/sn.crt -subj "/C=US/ST=ServiceNow/L=US/O=SN/CN=www.example.com"
cat /etc/pki/tls/certs/sn.key /etc/pki/tls/certs/sn.crt > /etc/pki/tls/certs/sn.pem
