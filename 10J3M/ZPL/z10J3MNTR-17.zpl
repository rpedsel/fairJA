set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 18.9861, <2> 30.1779, <3> 20.7062, <4> 24.7878, <5> 20.3642, <6> 28.3309, <7> 33.7864, <8> 22.2153, <9> 21.9859, <10> 27.1145;
param workload[JOB] := <1> 20.3762, <2> 2.2705, <3> 19.1888, <4> 49.9531, <5> 39.2469, <6> 15.916, <7> 21.8148, <8> 37.1965, <9> 11.4021, <10> 32.3131;
param capacity[MACHINE] := <1> 62.4195, <2> 62.4195, <3> 62.4195;

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
