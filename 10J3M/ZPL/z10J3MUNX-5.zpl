set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 32.7645, <2> 26.3671, <3> 31.0579, <4> 3.95, <5> 46.5859, <6> 13.5789, <7> 36.9384, <8> 24.2711, <9> 15.9284, <10> 2.6401;
param workload[JOB] := <1> 5.724, <2> 5.1349, <3> 5.573, <4> 1.9875, <5> 6.8254, <6> 3.685, <7> 6.0777, <8> 4.9266, <9> 3.991, <10> 1.6248;
param capacity[MACHINE] := <1> 45.5499, <2> 45.5499, <3> 45.5499;

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
