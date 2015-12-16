set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 24.5489, <2> 26.1386, <3> 1.0545, <4> 10.6596, <5> 12.9, <6> 15.0558, <7> 48.0508, <8> 43.2334, <9> 44.8571, <10> 39.5118;
param workload[JOB] := <1> 13.0213, <2> 47.6792, <3> 49.4644, <4> 22.3776, <5> 47.574, <6> 20.4426, <7> 0.1571, <8> 37.1624, <9> 20.4935, <10> 44.0746;
param capacity[MACHINE] := <1> 100.8156, <2> 100.8156, <3> 100.8156;

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
