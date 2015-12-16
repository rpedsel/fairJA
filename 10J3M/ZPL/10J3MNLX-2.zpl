set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 27.6302, <2> 25.8437, <3> 32.9098, <4> 31.5151, <5> 21.8408, <6> 26.2959, <7> 22.4929, <8> 27.8283, <9> 29.9072, <10> 26.024;
param workload[JOB] := <1> 5.2564, <2> 5.0837, <3> 5.7367, <4> 5.6138, <5> 4.6734, <6> 5.128, <7> 4.7427, <8> 5.2753, <9> 5.4687, <10> 5.1014;
param capacity[MACHINE] := <1> 17.36, <2> 17.36, <3> 17.36;

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
