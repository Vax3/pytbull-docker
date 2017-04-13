# Pytbull
pytbull is an Intrusion Detection/Prevention System (IDS/IPS) Testing Framework for Snort, Suricata and any IDS/IPS that generates an alert file. It can be used to test the detection and blocking capabilities of an IDS/IPS, to compare IDS/IPS, to compare configuration modifications and to check/validate configurations.

The framework is shipped with about 300 tests grouped in 11 testing modules:

- badTraffic: Non RFC compliant packets are sent to the server to test how packets are processed.
- bruteForce: tests the ability of the server to track brute force attacks (e.g. FTP). Makes use of custom rules on Snort and Suricata.
- clientSideAttacks: this module uses a reverse shell to provide the server with instructions to download remote malicious files. This module tests the ability of the IDS/IPS to protect against client-side attacks.
- denialOfService: tests the ability of the IDS/IPS to protect against DoS attempts
- evasionTechniques: various evasion techniques are used to check if the IDS/IPS can detect them.
- fragmentedPackets: various fragmented payloads are sent to server to test its ability to recompose them and detect the attacks.
- ipReputation: tests the ability of the server to detect traffic from/to low reputation servers.
- normalUsage: Payloads that correspond to a normal usage.
- pcapReplay: enables to replay pcap files
- shellCodes: send various shellcodes to the server on port 21/tcp to test the ability of the server to detect/reject shellcodes.
- testRules: basic rules testing. These attacks are supposed to be detected by the rules sets shipped with the IDS/IPS.

It is easily configurable and could integrate new modules in the future.

There are basically 5 types of tests:

- socket: open a socket on a given port and send the payloads to the remote target on that port.
- command: send command to the remote target with the subprocess.call() python function.
- scapy: send special crafted payloads based on the Scapy syntax
- client side attacks: use a reverse shell on the remote target and send commands to it to make them processed by the server (typically wget commands).

For launch the container type the following command:
* docker run -ti --network <network_with_idps> -e SFTP_LOGIN=<ftp_login> -e SFTP_PASSWORD=<ftp_password>  pytbull <IP.OF.YOUR.IDPS>

For testing your IDPS, you must:
* install vsftpd openssh-server and apache2 on your IDPS server and launch them
* copy the script in in the pytbull container at the following path => /opt/pytbull/server/pytbull-server.py on your IDPS server in the home directory of your ftp user => ~/pytbull-server.py
* create directory in the home directory of the ftp user => mkdir ~/pdf
* ensure that your ftp user must be acces to the fast.log file (depends of your IDPS configuration, by default it is in /var/log/{snort,suricata}/fast.log)
* choose the good file in the configuration file (/otp/pytbull/conf/config.cfg, choose snort or suricata configuration)
* launch the pytbull server script from the previous pdf directory => cd ~/pdf && ../pytbull-server.py

By default pytbull will check all categories, if you want to disable one or more categories, you can set 0 to the following environment variable:
* $CLIENT_SIDE_ATTACKS
* $TEST_RULES
* $BAD_TRAFFIC
* $FRAGMENTED_PACKETS
* $BRUTE_FORCE
* $EVASION_TECHNIQUES
* $SHELL_CODE
* $DENIAL_OF_SERVICE
* $PCAP_REPLAY
* $NORMAL_USAGE
* $IP_REPUTATION

If you have proxy you can set the following variables:
* $PROXY_HOST
* $PROXY_PORT
* $PROXY_USER
* $PROXY_PASS

For more informations, please see [the documentation](http://pytbull.sourceforge.net/index.php?page=documentation "pytbull official documentation")
