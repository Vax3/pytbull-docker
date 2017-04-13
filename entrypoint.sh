#!/bin/bash

if [ -z "${SFTP_LOGIN}" ]; then
    SFTP_LOGIN=root
fi

if [ -z "${SFTP_PASSWORD}" ]; then
    SFTP_PASSWORD=toor
fi

if [ -z "${CLIENT_SIDE_ATTACKS}" ]; then
    CLIENT_SIDE_ATTACKS=1
fi

if [ -z "${TEST_RULES}" ]; then
    TEST_RULES=1
fi

if [ -z "${BAD_TRAFFIC}" ]; then
    BAD_TRAFFIC=1
fi

if [ -z "${FRAGMENTED_PACKETS}" ]; then
    FRAGMENTED_PACKETS=1
fi

if [ -z "${BRUTE_FORCE}" ]; then
    BRUTE_FORCE=1
fi

if [ -z "${EVASION_TECHNIQUES}" ]; then
    EVASION_TECHNIQUES=1
fi

if [ -z "${SHELL_CODE}" ]; then
    SHELL_CODE=1
fi

if [ -z "${DENIAL_OF_SERVICE}" ]; then
    DENIAL_OF_SERVICE=1
fi

if [ -z "${PCAP_REPLAY}" ]; then
    PCAP_REPLAY=1
fi

if [ -z "${NORMAL_USAGE}" ]; then
    NORMAL_USAGE=1
fi

if [ -z "${IP_REPUTATION}" ]; then
    IP_REPUTATION=1
fi

if [ -z "${REVERSES_SHELL_PORT}" ]; then
    REVERSES_SHELL_PORT=12345
fi

function render-template {
  eval "echo \"$(cat $1)\""
}

render-template /opt/pytbull/conf/config.cfg.tpl > /opt/pytbull/conf/config.cfg && rm /opt/pytbull/conf/config.cfg.tpl

./pytbull -t $1
