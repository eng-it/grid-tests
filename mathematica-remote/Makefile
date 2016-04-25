# Example remote Mathematica kernel, intended to connect to a font-end session
# already running outside of the grid.
#
# First launch Mathematica on your own computer and create a TCPIP link as shown
# on this page:
#    http://collaborate.bu.edu/engit/Grid/Mathematica
# Then here on the grid run:
#    make LINK=<the-link-text-from-Mathematica>
#
# Note that it requires one link (as a pair of TCP/IP sockets) per remote kernel
# so trying to start up an array job with one link won't work.  You can manually
# create multiple links and submit separate jobs, but in the future we may have
# Grid Engine integration to improve this.
#
# The remote end will need to be accessible from the grid node, so, on the VPN
# if off-campus, and not restricted by a firewall on the ports being used by the
# TCP/IP link.

queue = bme.q

all: mathematica-remote
	qstat

mathematica-remote:
	qsub -q "$(queue)" mathematica-remote.sh "$(LINK)"

# Remove all stdout/stderr files for all test cases.
clean:
	rm -f  mathematica-remote.{o,e,po,pe}*
