#!/usr/bin/env bash

# Set up an example directory with some reasonable defaults
if [ $# -lt 1 ] 
then
	echo "$0 name-of-example"
	exit 1
fi

name="$1"
mkdir -p "$name"

# Default Makefile
cat > "$name/Makefile" <<MAKEFILE
# ( Describe "$name" here )
queue = bme.q

clean:
	rm -f *.{o,e,po,pe}*
	rm -f core.*
MAKEFILE

# Default job script
cat > "$name/$name.sh" <<JOBSCRIPT
#!/usr/bin/env bash
#$ -cwd
#$ -l s_vmem=2G
#$ -N $name
JOBSCRIPT
chmod +x "$name/$name.sh"
