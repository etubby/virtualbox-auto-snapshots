#!/bin/bash
#set the date and time for the snapshot description
NOW=`date +"%m-%d-%Y%T"`

#using the day of the week so that we only keep a weeks worth of snapshots
TAG=$(date +%u)
VM_NAME=your_vm_name
SNAPSHOT_NAME="HASS_$TAG"
SNAPSHOT_DESCRIPTION="Snapshot taken on $NOW"

#delete snapshot with this tag if it exists
VBoxManage snapshot $VM_NAME delete "$SNAPSHOT_NAME"

#create a new snapshot with this tag
VBoxManage snapshot $VM_NAME take "$SNAPSHOT_NAME" --description "$SNAPSHOT_DESCRIPTION"
