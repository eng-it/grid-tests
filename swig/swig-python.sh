#$ -N swig-python
#$ -cwd
#$ -l s_vmem=1G

module load swig
module load anaconda

swig -python example_python.i
gcc -c -fpic example.c example_python_wrap.c
gcc -shared example.o example_python_wrap.o -o _example_python.so

echo "Example Python script outputs:"
python swig-python.py
