set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 0.9826, <2> 32.3908, <3> 27.172, <4> 49.2229, <5> 19.7915, <6> 0.9668, <7> 3.2832, <8> 38.9926, <9> 30.5555, <10> 29.3605;
param workload[JOB] := <1> 0.9655, <2> 1049.1639, <3> 738.3176, <4> 2422.8939, <5> 391.7035, <6> 0.9347, <7> 10.7794, <8> 1520.4229, <9> 933.6386, <10> 862.039;
param capacity[MACHINE] := <1> 7930.859, <2> 7930.859, <3> 7930.859;

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
