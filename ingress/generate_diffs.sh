#!/bin/bash

NODES="networking-lab networking-lab-m02"

for node in $NODES; do
    echo -e "\n\n----[ $node ]----\n\n"

    # diff routing first
    echo -e "\n\n==> routing <==\n\n"
    diff -ruN routing/pre-apply/$node/${node}_pre-apply.routing routing/post-apply/$node/${node}_post-apply.routing | tee ${node}_routing.diff

    # next, iptables
    echo -e "\n\n\n==> iptables <==\n\n"
    diff -ruN iptables/pre-apply/$node/${node}_pre-apply.iptables iptables/post-apply/$node/${node}_post-apply.iptables | tee ${node}_iptables.diff

    echo -e "\n\n\n\n[DONE] $node\n\n\n\n\n\n\n\n"
done
