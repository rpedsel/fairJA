set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 44.6505, <2> 43.1041, <3> 47.0382, <4> 8.0904, <5> 20.278, <6> 38.0989, <7> 32.0375, <8> 22.0995, <9> 17.769, <10> 37.5289;
param workload[JOB] := <1> 44.6505, <2> 43.1041, <3> 47.0382, <4> 8.0904, <5> 20.278, <6> 38.0989, <7> 32.0375, <8> 22.0995, <9> 17.769, <10> 37.5289;
param capacity[MACHINE] := <1> 103.565, <2> 103.565, <3> 103.565;

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
