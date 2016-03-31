#!/usr/bin/env python

"""Example grid job made to show memory limits and use up RAM."""

from __future__ import print_function
import sys
import os
import time
import resource

MB = 1024*1024
PS = resource.getpagesize()

# http://unix.stackexchange.com/questions/99334/how-to-fill-90-of-the-free-memory/#answer-99365
# This definitely works accordding to sys.getsizeof(megabyte) though I'm not
# sure why

def show_environment():
    try:
        nslots = os.environ['NSLOTS']
        print("SGE Job Slots: %s" % nslots)
    except KeyError:
        pass
    soft, hard = resource.getrlimit(resource.RLIMIT_AS)
    print("Hard RAM limit (MB): %d" % (hard/MB))
    print("Soft RAM limit (MB): %d" % (soft/MB))
    print()

# total program size in MB
def ram_used():
    # memory status in bytes
    # see proc(5)
    with open('/proc/self/statm') as f:
        memvals = map(int, f.read().strip().split(' '))
        memvals = map(lambda x: x*PS, memvals)
    # then, just  take total size and conver to MB
    return memvals[0]/MB

# This isn't quite right because the interpreter briefly has two copies of
# objects in RAM when assigning, but, close enough.
def fill_up_to(count):
    megabyte = (0,) * (1024 * 1024 / 8)
    data = []
    mb_used = ram_used()
    print("Total MB used in process: %d" % mb_used)
    while mb_used < count:
        data.append(megabyte*10)
        mb_used = ram_used()
        print("Total MB used in process: %d" % mb_used)
        time.sleep(0.5)

def main(args):
    try:
        count = int(args[1])
    except IndexError:
        print("Usage: ./use_ram amount-in-mb")
        sys.exit(1)
    show_environment()
    fill_up_to(count)

if __name__ == "__main__":
    main(sys.argv)
