set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 21.0125, <2> 23.989, <3> 32.6419, <4> 27.7761, <5> 17.7736, <6> 23.8178, <7> 19.4716, <8> 30.5044, <9> 23.6665, <10> 18.3172;
param workload[JOB] := <1> 4.5839, <2> 4.8979, <3> 5.7133, <4> 5.2703, <5> 4.2159, <6> 4.8803, <7> 4.4127, <8> 5.5231, <9> 4.8648, <10> 4.2799;
param capacity[MACHINE] := <1> 48.6421, <2> 48.6421, <3> 48.6421;

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
