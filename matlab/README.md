# matlab

This is a simple MATLAB batch job, presented in both a compiled and un-compiled
version.  The compiled approach is preferable since it will not use up any
licenses while running.  When running many jobs in parallel, the compiled
approach is required.  Also see [the compiled MATLAB wiki
page](http://collaborate.bu.edu/engit/Grid/Matlab).

The example code here is split into two files to show how MATLAB handles
finding function calls for both cases.

## compile_and_run

This example both compiles and then executes the MATLAB code.  Normally this
would probably be two separate steps (compile once, run many times).

Note that both m-files must be specified at compile-time.  If not, the example
will run, but it will actually load the `make_pretty_mesh` function from the
source file at run-time instead of compiling it in.  For more thorough coverage
see the "Compiling Embedded M-Files" section
[here](http://www-rohan.sdsu.edu/doc/matlab/toolbox/compiler/mcc.html).

While running this job, watch license usage with the command `lmstat -a -c
1711@matlablic1`.  Only the feature "Compiler" should show up for your
username, and will eventually go away after the compiling is done.  The
"MATLAB" feature should not be used at all.

## just_run

This runs the same code, but without compiling.  A license query will show the
feature "MATLAB" in use during execution.
