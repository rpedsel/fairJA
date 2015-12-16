set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 27.7399, <2> 25.0802, <3> 23.7363, <4> 34.3644, <5> 30.2767, <6> 27.6031, <7> 21.9473, <8> 24.8728, <9> 31.8736, <10> 19.9437;
param workload[JOB] := <1> 769.5021, <2> 629.0164, <3> 563.4119, <4> 1180.912, <5> 916.6786, <6> 761.9311, <7> 481.684, <8> 618.6562, <9> 1015.9264, <10> 397.7512;
param capacity[MACHINE] := <1> 2445.1566, <2> 2445.1566, <3> 2445.1566;

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
