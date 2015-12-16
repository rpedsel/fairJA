set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 40.71, <2> 5.1993, <3> 17.7724, <4> 47.7973, <5> 37.7746, <6> 5.1303, <7> 37.8304, <8> 10.0397, <9> 29.815, <10> 48.0935;
param workload[JOB] := <1> 6.3804, <2> 2.2802, <3> 4.2157, <4> 6.9136, <5> 6.1461, <6> 2.265, <7> 6.1506, <8> 3.1685, <9> 5.4603, <10> 6.9349;
param capacity[MACHINE] := <1> 49.9153, <2> 49.9153, <3> 49.9153;

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
