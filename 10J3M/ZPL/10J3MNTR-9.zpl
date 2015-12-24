set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 25.6331, <2> 32.8935, <3> 26.1088, <4> 20.3124, <5> 20.7384, <6> 15.1699, <7> 21.8006, <8> 30.9803, <9> 33.7751, <10> 26.5482;
param workload[JOB] := <1> 9.1086, <2> 46.6393, <3> 36.7926, <4> 47.1799, <5> 8.6687, <6> 12.4457, <7> 27.0227, <8> 31.9844, <9> 39.1312, <10> 44.7577;
param capacity[MACHINE] := <1> 75.9327, <2> 75.9327, <3> 75.9327;

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
