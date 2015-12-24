set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 48.8377, <2> 28.9915, <3> 5.8005, <4> 21.5713, <5> 18.4835, <6> 44.6899, <7> 20.184, <8> 39.6022, <9> 8.9948, <10> 38.2336;
param workload[JOB] := <1> 2385.1209, <2> 840.5071, <3> 33.6458, <4> 465.321, <5> 341.6398, <6> 1997.1872, <7> 407.3939, <8> 1568.3342, <9> 80.9064, <10> 1461.8082;
param capacity[MACHINE] := <1> 9581.8645, <2> 9581.8645, <3> 9581.8645;

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
