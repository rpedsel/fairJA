set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 32.4495, <2> 22.0857, <3> 19.1114, <4> 28.5463, <5> 26.3126, <6> 29.2464, <7> 25.0392, <8> 20.1046, <9> 25.3791, <10> 21.0478;
param workload[JOB] := <1> 5.6964, <2> 4.6995, <3> 4.3717, <4> 5.3429, <5> 5.1296, <6> 5.408, <7> 5.0039, <8> 4.4838, <9> 5.0378, <10> 4.5878;
param capacity[MACHINE] := <1> 16.5871, <2> 16.5871, <3> 16.5871;

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
