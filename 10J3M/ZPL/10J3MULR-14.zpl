set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 46.2358, <2> 40.3153, <3> 41.9484, <4> 49.9618, <5> 4.5649, <6> 16.1805, <7> 25.1378, <8> 12.551, <9> 35.6979, <10> 12.5301;
param workload[JOB] := <1> 42.0529, <2> 20.4238, <3> 47.0722, <4> 13.9242, <5> 9.6967, <6> 11.9064, <7> 35.8579, <8> 41.4202, <9> 40.7559, <10> 34.9542;
param capacity[MACHINE] := <1> 99.3548, <2> 99.3548, <3> 99.3548;

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
