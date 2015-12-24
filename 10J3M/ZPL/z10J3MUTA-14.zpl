set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 4.6117, <2> 7.4842, <3> 43.1395, <4> 29.0148, <5> 7.6948, <6> 6.8099, <7> 32.598, <8> 16.9706, <9> 16.154, <10> 14.2144;
param workload[JOB] := <1> 21.2678, <2> 56.0132, <3> 1861.0165, <4> 841.8586, <5> 59.2099, <6> 46.3747, <7> 1062.6296, <8> 288.0013, <9> 260.9517, <10> 202.0492;
param capacity[MACHINE] := <1> 2460.3528, <2> 2460.3528, <3> 2460.3528;

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
