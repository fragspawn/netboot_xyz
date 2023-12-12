#Netboot XYZ running example in Docker Compse

Build a proof-of-concept that will netboot clients on a single user-defined NIC

##Components
netbootxyz/netbootxyz - Contains nginx and tftpd with admin panel to populate documentroot with images
networkboot/dhcpd - A dhcpd server configured to point to tftp netboot xyz image for execution

##volumes
assets - the documentroot for nginx server
config - the netboot xyz config and admin panel files 
dhcpd - dhcpd.conf with net configs for pxebooting

##setup
edit docker-compse last line with the NIC interface name on the host running this
configure abive NIC with common address subnet to the one defined in dhcpd.conf
provide the NIC with a route to the Internet

##use
`docker compose up` to instantiate the two containers
PXE boot 2nd PC connected via ethernet
visit `http://localhost:3000` to view netbootxyz admin panel

##improvments
Security-wise the netboot tftp & http servers should only listen to the NIC defined for dhcpd
Use .env to store configs, like NIC, netboot filename
