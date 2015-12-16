set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 23.5675, <2> 34.4545, <3> 10.2989, <4> 10.6009, <5> 18.0161, <6> 29.5804, <7> 26.2938, <8> 2.5721, <9> 6.0087, <10> 2.7414;
param workload[JOB] := <1> 23.5675, <2> 34.4545, <3> 10.2989, <4> 10.6009, <5> 18.0161, <6> 29.5804, <7> 26.2938, <8> 2.5721, <9> 6.0087, <10> 2.7414;
param capacity[MACHINE] := <1> 164.1343, <2> 164.1343, <3> 164.1343;

var x[JM] binary;
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
