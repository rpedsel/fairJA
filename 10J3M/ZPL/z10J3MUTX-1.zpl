set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 11.6106, <2> 19.3021, <3> 44.6687, <4> 14.7427, <5> 44.2894, <6> 22.7954, <7> 41.5141, <8> 2.6267, <9> 12.3729, <10> 47.6693;
param workload[JOB] := <1> 3.4074, <2> 4.3934, <3> 6.6835, <4> 3.8396, <5> 6.655, <6> 4.7745, <7> 6.4431, <8> 1.6207, <9> 3.5175, <10> 6.9043;
param capacity[MACHINE] := <1> 12.0598, <2> 12.0598, <3> 12.0598;

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
