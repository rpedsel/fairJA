set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 9.5948, <2> 33.6168, <3> 42.8147, <4> 32.7924, <5> 17.6622, <6> 29.6685, <7> 44.0712, <8> 1.652, <9> 19.0928, <10> 7.9476;
param workload[JOB] := <1> 3.0975, <2> 5.798, <3> 6.5433, <4> 5.7265, <5> 4.2026, <6> 5.4469, <7> 6.6386, <8> 1.2853, <9> 4.3695, <10> 2.8191;
param capacity[MACHINE] := <1> 15.3091, <2> 15.3091, <3> 15.3091;

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
