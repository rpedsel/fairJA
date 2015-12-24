set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 32.8618, <2> 3.3337, <3> 15.2525, <4> 18.1418, <5> 45.5104, <6> 21.7318, <7> 49.4131, <8> 21.199, <9> 5.5463, <10> 0.6386;
param workload[JOB] := <1> 32.8618, <2> 3.3337, <3> 15.2525, <4> 18.1418, <5> 45.5104, <6> 21.7318, <7> 49.4131, <8> 21.199, <9> 5.5463, <10> 0.6386;
param capacity[MACHINE] := <1> 213.629, <2> 213.629, <3> 213.629;

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
