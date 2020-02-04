#!/bin/sh

tok=`kubeadm token generate`
kubeadm token create $tok --print-join-command --ttl=0
