# Example workflow for giving a batch job kerberos credentials for access to
# secure network filesystems.
#
# Generally the best option is to use scratch space in /mnt/nokrb/$USER as
# that's simpler and won't expose your credentials to any risk (even
# temporarily, as this may).  But if needed, this process shows one possible
# workaround.
#
# The steps, below and in the job script, are:
# 1) before submitting the job, copy the current credentials to /mnt/nokrb
# 2) submit the job script as usual
# 3) within the job, copy the credentials from /mnt/nokrb to local disk
#    and configure kerberos to use that.  Also run a script in the backround
#    to renew the credentials up the maximum lifetime.

queue ?= bme.q

all: qsub-krb5
	qstat

# Here we request renewal of the current ticket (just in case it's near
# expiration already), copy it to nokrb so the running job will be able to
# access it, and start the job.  qsub-krb5.sh has a few steps to set up the
# ticket on the remote end at the start of the job.
# 
# Don't leave /mnt/nokrb/$USER/krb5cc there any longer than necessary.  Once
# the job has started it should have made its own copy for local use and the
# nokrb one can be deleted.
krb5cc := $(shell echo $(KRB5CCNAME) | sed 's/^FILE://')
qsub-krb5:
	kinit -R
	install $(krb5cc) /mnt/nokrb/$(USER)/krb5cc -m 600
	qsub -q $(queue) qsub-krb5.sh

clean:
	rm -f qsub-krb5.{o,e}*
	rm -f /mnt/nokrb/$(USER)/krb5cc
