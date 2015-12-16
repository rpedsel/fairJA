set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 27.1554, <2> 19.4418, <3> 22.4103, <4> 24.7939, <5> 24.3702, <6> 18.9647, <7> 30.8234, <8> 29.4548, <9> 27.8711, <10> 20.5926;
param workload[JOB] := <1> 18.8429, <2> 42.8933, <3> 48.7531, <4> 47.3192, <5> 39.5488, <6> 5.7734, <7> 31.7458, <8> 43.367, <9> 7.1804, <10> 15.4242;
param capacity[MACHINE] := <1> 300.8481, <2> 300.8481, <3> 300.8481;

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
