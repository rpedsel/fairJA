set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 18.0858, <2> 33.006, <3> 26.109, <4> 31.139, <5> 18.8387, <6> 25.6048, <7> 24.3717, <8> 33.0617, <9> 23.7553, <10> 26.5527;
param workload[JOB] := <1> 18.0858, <2> 33.006, <3> 26.109, <4> 31.139, <5> 18.8387, <6> 25.6048, <7> 24.3717, <8> 33.0617, <9> 23.7553, <10> 26.5527;
param capacity[MACHINE] := <1> 65.1312, <2> 65.1312, <3> 65.1312;

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
