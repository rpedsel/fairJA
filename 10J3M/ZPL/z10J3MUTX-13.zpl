set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 11.0307, <2> 36.076, <3> 44.641, <4> 4.4989, <5> 43.5174, <6> 32.5642, <7> 0.6544, <8> 8.6652, <9> 14.3832, <10> 47.7647;
param workload[JOB] := <1> 3.3212, <2> 6.0063, <3> 6.6814, <4> 2.1211, <5> 6.5968, <6> 5.7065, <7> 0.8089, <8> 2.9437, <9> 3.7925, <10> 6.9112;
param capacity[MACHINE] := <1> 11.2224, <2> 11.2224, <3> 11.2224;

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
