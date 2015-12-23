set JOB := {1 .. 20};
set MACHINE := {1 .. 7};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 32.7043, <2> 26.4956, <3> 24.8303, <4> 26.4732, <5> 33.8954, <6> 23.9161, <7> 20.2026, <8> 16.1157, <9> 20.8083, <10> 21.9036, <11> 27.8376, <12> 29.513, <13> 33.1527, <14> 29.3538, <15> 16.1285, <16> 30.3017, <17> 20.2993, <18> 22.8263, <19> 24.8854, <20> 23.6513;
param workload[JOB] := <1> 5.7188, <2> 5.1474, <3> 4.983, <4> 5.1452, <5> 5.822, <6> 4.8904, <7> 4.4947, <8> 4.0144, <9> 4.5616, <10> 4.6801, <11> 5.2761, <12> 5.4326, <13> 5.7578, <14> 5.4179, <15> 4.016, <16> 5.5047, <17> 4.5055, <18> 4.7777, <19> 4.9885, <20> 4.8633;
param capacity[MACHINE] := <1> 14.2854, <2> 14.2854, <3> 14.2854, <4> 14.2854, <5> 14.2854, <6> 14.2854, <7> 14.2854;

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
