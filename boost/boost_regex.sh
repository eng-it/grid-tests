#!/usr/bin/env bash
#$ -cwd
#$ -l s_vmem=2G
#$ -j y
#$ -N boost_regex

module load boost
module load gnu-build-system

g++ -l boost_regex boost_regex.cpp -o boost_regex

# Use a regular expression to match the subject line in email text.
./boost_regex <<EMAILTEXT
To: George Shmidlap
From: Rita Marlowe
Subject: Will Success Spoil Rock Hunter?
---
See subject.
EMAILTEXT
