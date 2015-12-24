set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 2.3303, <2> 5.666, <3> 42.0248, <4> 19.959, <5> 31.9592, <6> 20.9118, <7> 34.5382, <8> 26.9437, <9> 18.1461, <10> 11.3961;
param workload[JOB] := <1> 5.4303, <2> 32.1036, <3> 1766.0838, <4> 398.3617, <5> 1021.3905, <6> 437.3034, <7> 1192.8873, <8> 725.963, <9> 329.2809, <10> 129.8711;
param capacity[MACHINE] := <1> 6038.6756, <2> 6038.6756, <3> 6038.6756;

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
