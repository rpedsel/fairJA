set JOB := {1 .. 20};
set MACHINE := {1 .. 7};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 18.5441, <2> 40.1104, <3> 17.9291, <4> 13.4517, <5> 2.6311, <6> 14.9791, <7> 45.7034, <8> 25.23, <9> 2.1261, <10> 2.2359, <11> 29.6873, <12> 11.8132, <13> 33.9264, <14> 14.0373, <15> 8.592, <16> 5.5981, <17> 14.6947, <18> 49.9405, <19> 25.9641, <20> 22.5227;
param workload[JOB] := <1> 18.5441, <2> 40.1104, <3> 17.9291, <4> 13.4517, <5> 2.6311, <6> 14.9791, <7> 45.7034, <8> 25.23, <9> 2.1261, <10> 2.2359, <11> 29.6873, <12> 11.8132, <13> 33.9264, <14> 14.0373, <15> 8.592, <16> 5.5981, <17> 14.6947, <18> 49.9405, <19> 25.9641, <20> 22.5227;
param capacity[MACHINE] := <1> 57.1025, <2> 57.1025, <3> 57.1025, <4> 57.1025, <5> 57.1025, <6> 57.1025, <7> 57.1025;

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
