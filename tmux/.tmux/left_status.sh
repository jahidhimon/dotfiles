#!/bin/bash


function internet_status(){
  if ping -q -c 1 -W 1 8.8.8.8 >/dev/null; then
    fgcolor='#[fg=colour10]'
    net_status='[●]'
  else
    fgcolor='#[fg=brightred]'
    net_status='[●]'
  fi
  printf "%s" "${fgcolor}${net_status}${fgdefault}"
}

function tun0_status() {
  fgdefault='#[fg=colour10]'
  interface_name='tun0'
  if ifconfig tun0 | grep -q '00-00-00-00-00-00-00-00-00-00-00-00-00-00-00-00'; then
     fgcolor='#[fg=colour10]'
   else
     fgcolor='#[fg=#d14545]'
   fi
   printf " [%s]" "${fgcolor}${interface_name}${fgdefault}"
}

function main() {
  internet_status
  tun0_status
}

 # Calling the main function which will call the other functions.
 main
