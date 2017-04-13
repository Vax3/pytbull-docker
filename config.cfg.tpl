[CLIENT]
ipaddr                  = 172.17.1.2
iface                   = eth0
useproxy                = 0
proxyhost               = $PROXY_HOST
proxyport               = $PROXY_PORT
proxyuser               = $PROXY_USER
proxypass               = $PROXY_PASS

[PATHS]
db                      = data/pytbull.db
urlpdf                  = https://github.com/sebastiendamaye/public/raw/master/infected/
pdfdir                  = pdf/malicious
pcapdir                 = pcap
tempfile                = /tmp/pytbull.tmp
#alertsfile              = /var/log/snort/alert
alertsfile              = /var/log/suricata/fast.log

[ENV]
sudo                    = /usr/bin/sudo
nmap                    = /usr/bin/nmap
nikto                   = /usr/bin/nikto
niktoconf               = /etc/nikto/config.txt
hping3                  = /usr/sbin/hping3
tcpreplay               = /usr/bin/tcpreplay
ab                      = /usr/bin/ab
ping                    = /bin/ping
ncrack                  = /usr/local/bin/ncrack
ncrackusers             = data/ncrack-users.txt
ncrackpasswords         = data/ncrack-passwords.txt
localhost               = 127.0.0.1

[FTP]
ftpproto                = sftp
ftpport                 = 22
ftpuser                 = $SFTP_LOGIN
ftppasswd               = $SFTP_PASSWORD

[TIMING]
sleepbeforegetalerts    = 2
sleepbeforenexttest     = 2
sleepbeforetwoftp       = 2
urltimeout              = 10

[SERVER]
reverseshellport        = $REVERSES_SHELL_PORT

[TESTS]
clientSideAttacks       = $CLIENT_SIDE_ATTACKS
testRules               = $TEST_RULES
badTraffic              = $BAD_TRAFFIC
fragmentedPackets       = $FRAGMENTED_PACKETS
bruteForce              = $BRUTE_FORCE
evasionTechniques       = $EVASION_TECHNIQUES
shellCodes              = $SHELL_CODE
denialOfService         = $DENIAL_OF_SERVICE
pcapReplay              = $PCAP_REPLAY
normalUsage             = $NORMAL_USAGE
ipReputation            = $IP_REPUTATION

[TESTS_PARAMS]
ipreputationnbtests     = 10
