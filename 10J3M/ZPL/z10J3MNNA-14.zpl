set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 23.3595, <2> 26.9432, <3> 21.2808, <4> 18.9499, <5> 22.1627, <6> 26.2413, <7> 26.8885, <8> 29.3652, <9> 18.5515, <10> 31.8013;
param workload[JOB] := <1> 545.6662, <2> 725.936, <3> 452.8724, <4> 359.0987, <5> 491.1853, <6> 688.6058, <7> 722.9914, <8> 862.315, <9> 344.1582, <10> 1011.3227;
param capacity[MACHINE] := <1> 6204.1517, <2> 6204.1517, <3> 6204.1517;

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
