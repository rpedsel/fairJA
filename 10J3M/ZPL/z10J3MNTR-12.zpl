set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 23.4289, <2> 14.3747, <3> 26.8152, <4> 21.8977, <5> 24.6699, <6> 19.1665, <7> 25.3518, <8> 23.3953, <9> 18.7875, <10> 30.2016;
param workload[JOB] := <1> 26.4416, <2> 2.4642, <3> 19.7088, <4> 5.8723, <5> 6.7481, <6> 12.8452, <7> 10.6154, <8> 4.4526, <9> 41.0366, <10> 0.1287;
param capacity[MACHINE] := <1> 32.5784, <2> 32.5784, <3> 32.5784;

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
