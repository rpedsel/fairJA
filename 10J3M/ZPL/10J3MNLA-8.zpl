set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 32.3319, <2> 34.1341, <3> 28.6464, <4> 31.6257, <5> 17.5358, <6> 18.6159, <7> 20.5912, <8> 23.1498, <9> 24.1849, <10> 26.7917;
param workload[JOB] := <1> 1045.3518, <2> 1165.1368, <3> 820.6162, <4> 1000.1849, <5> 307.5043, <6> 346.5517, <7> 423.9975, <8> 535.9132, <9> 584.9094, <10> 717.7952;
param capacity[MACHINE] := <1> 2315.987, <2> 2315.987, <3> 2315.987;

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
