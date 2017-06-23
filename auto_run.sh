#!/bin/bash

ps_num=4
worker_num=12
B=4
for i in `eval echo {0..$ps_num}`
do
  python atari_pathnet.py --ps_hosts_num=$ps_num --worker_hosts_num=$worker_num --job_name=ps --task_index=$i --B=$B &
done

for i in `eval echo {0..$worker_num}`
do
  python atari_pathnet.py --ps_hosts_num=$ps_num --worker_hosts_num=$worker_num --job_name=worker --task_index=$i --B=$B &
done
