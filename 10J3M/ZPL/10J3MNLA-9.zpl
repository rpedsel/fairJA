set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 28.4867, <2> 31.0968, <3> 24.5893, <4> 19.324, <5> 23.9844, <6> 25.5071, <7> 25.5551, <8> 15.2176, <9> 27.1208, <10> 22.3406;
param workload[JOB] := <1> 811.4921, <2> 967.011, <3> 604.6337, <4> 373.417, <5> 575.2514, <6> 650.6122, <7> 653.0631, <8> 231.5753, <9> 735.5378, <10> 499.1024;
param capacity[MACHINE] := <1> 2033.8987, <2> 2033.8987, <3> 2033.8987;

var x[JM];
var z;
maximize minBenefit: z;
subto Z:
   forall <m> in MACHINE do
      sum <j> in JOB : benefit[j] * x[j,m] >= z;
subto K:
   forall <m> in MACHINE do
      sum <j> in JOB : workload[j] * x[j,m] <= capacity[m];
subto X:
   forall <j> in JOB do
      sum <m> in MACHINE : x[j,m] <= 1;
subto A:
   forall <j,m> in JM do
      x[j,m] >= 0;
