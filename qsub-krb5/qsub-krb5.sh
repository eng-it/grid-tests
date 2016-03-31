#!/bin/bash
# 
# 
#$ -N qsub-krb5
#$ -cwd
#$ -j y
#$ -l s_vmem=512M

# Copy the prepared kerberos credentials cache over to local disk (with the
# appropriate permissions!) and make sure kerberos will use it.  As soon as this
# job has called the "install" command it should be fine to remove the nokrb
# copy.
ticket_nokrb="/mnt/nokrb/$USER/krb5cc"
ticket_local="/tmp/krb5cc_$UID"
install "$ticket_nokrb" "$ticket_local" -m 600
export KRB5CCNAME="FILE:$ticket_local"

# This will run in a loop, renewing the tickets for up to the maximum renewal
# lifetime (one week).  If you need kerberos access for longer than this, log
# into to the compute node remotely and manually run:
# kinit -c /tmp/krb5cc_$UID
renewtickets &

# renewtickets prints a line when it starts; this just makes sure that ends up
# at the top of the output file.
sleep 1

echo
echo "Compute node: $(hostname)"
echo
echo "Kerberos credentials at start of job:"
echo
klist
echo

echo "Home directory access test:"
touch ~/testfile
ls -l ~/testfile
rm ~/testfile

echo
echo "Kerberos credentials after home directory access:"
echo
klist
