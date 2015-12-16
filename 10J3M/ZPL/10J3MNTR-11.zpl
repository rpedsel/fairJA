set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 18.8806, <2> 26.4528, <3> 32.8747, <4> 18.3098, <5> 27.0303, <6> 27.187, <7> 27.957, <8> 28.9166, <9> 30.2993, <10> 29.3409;
param workload[JOB] := <1> 39.407, <2> 41.4583, <3> 15.4214, <4> 26.2973, <5> 32.1744, <6> 7.899, <7> 2.8159, <8> 10.9044, <9> 47.3801, <10> 3.7067;
param capacity[MACHINE] := <1> 56.8661, <2> 56.8661, <3> 56.8661;

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
