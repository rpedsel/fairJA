set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 45.7121, <2> 13.1927, <3> 3.7077, <4> 39.1536, <5> 5.0199, <6> 47.5753, <7> 44.8444, <8> 47.8137, <9> 24.7911, <10> 7.1808;
param workload[JOB] := <1> 2089.5961, <2> 174.0473, <3> 13.747, <4> 1533.0044, <5> 25.1994, <6> 2263.4092, <7> 2011.0202, <8> 2286.1499, <9> 614.5986, <10> 51.5639;
param capacity[MACHINE] := <1> 11062.336, <2> 11062.336, <3> 11062.336;

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
