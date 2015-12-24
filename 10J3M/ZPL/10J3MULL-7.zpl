set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 7.9277, <2> 15.2655, <3> 41.4365, <4> 34.142, <5> 37.1856, <6> 18.867, <7> 37.6979, <8> 34.0964, <9> 14.1994, <10> 47.4154;
param workload[JOB] := <1> 7.9277, <2> 15.2655, <3> 41.4365, <4> 34.142, <5> 37.1856, <6> 18.867, <7> 37.6979, <8> 34.0964, <9> 14.1994, <10> 47.4154;
param capacity[MACHINE] := <1> 96.0778, <2> 96.0778, <3> 96.0778;

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
