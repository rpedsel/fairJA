set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 36.9466, <2> 31.4454, <3> 48.8472, <4> 18.8333, <5> 7.1034, <6> 31.3537, <7> 13.5877, <8> 47.4162, <9> 0.7735, <10> 18.5742;
param workload[JOB] := <1> 32.6715, <2> 36.7251, <3> 37.9397, <4> 1.1994, <5> 28.6399, <6> 32.2014, <7> 0.095, <8> 3.3159, <9> 18.5636, <10> 49.3848;
param capacity[MACHINE] := <1> 80.2454, <2> 80.2454, <3> 80.2454;

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
