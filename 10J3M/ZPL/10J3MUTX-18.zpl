set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 47.9291, <2> 30.5105, <3> 35.5998, <4> 3.3547, <5> 37.0367, <6> 41.3839, <7> 5.6994, <8> 48.1385, <9> 34.7236, <10> 33.9873;
param workload[JOB] := <1> 6.9231, <2> 5.5236, <3> 5.9666, <4> 1.8316, <5> 6.0858, <6> 6.433, <7> 2.3873, <8> 6.9382, <9> 5.8927, <10> 5.8299;
param capacity[MACHINE] := <1> 13.453, <2> 13.453, <3> 13.453;

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
