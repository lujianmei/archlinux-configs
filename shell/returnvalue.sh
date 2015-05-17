#!/bin/bash
cd /data &> /dev/null
echo rv: $?
cd $(pwd) &> /dev/null
echo rv: $?
