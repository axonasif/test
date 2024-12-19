#!/bin/bash

function main() {
  set -eux

  apt-get update
  apt-get install strongswan xl2tpd net-tools -yq

  VPN_CREDS_PATH="/home/vscode/vpn_creds"
  if [ ! -f "$VPN_CREDS_PATH" ]; then
    echo "VPN credentials file not found at $VPN_CREDS_PATH"
    return 0
  fi

  source "/home/vscode/vpn_creds"

  cat > /etc/ipsec.conf <<EOF
  # ipsec.conf - strongSwan IPsec configuration file

  conn myvpn
    auto=add
    keyexchange=ikev1
    authby=secret
    type=transport
    left=%defaultroute
    leftprotoport=17/1701
    rightprotoport=17/1701
    right=$VPN_SERVER_IP
    ike=aes128-sha1-modp2048
    esp=aes128-sha1
EOF

  cat > /etc/ipsec.secrets <<EOF
  : PSK "$VPN_IPSEC_PSK"
EOF

  chmod 600 /etc/ipsec.secrets

  cat > /etc/xl2tpd/xl2tpd.conf <<EOF
  [lac myvpn]
  lns = $VPN_SERVER_IP
  ppp debug = yes
  pppoptfile = /etc/ppp/options.l2tpd.client
  length bit = yes
EOF

  cat > /etc/ppp/options.l2tpd.client <<EOF
  ipcp-accept-local
  ipcp-accept-remote
  refuse-eap
  require-chap
  noccp
  noauth
  mtu 1280
  mru 1280
  noipdefault
  defaultroute
  usepeerdns
  connect-delay 5000
  name "$VPN_USER"
  password "$VPN_PASSWORD"
EOF

  chmod 600 /etc/ppp/options.l2tpd.client


  mkdir -p /var/run/xl2tpd
  touch /var/run/xl2tpd/l2tp-control
}

main