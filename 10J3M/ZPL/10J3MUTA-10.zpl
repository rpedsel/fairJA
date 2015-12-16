set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 10.1957, <2> 5.9856, <3> 48.9777, <4> 35.5985, <5> 47.7767, <6> 34.4954, <7> 27.9505, <8> 39.3451, <9> 12.3091, <10> 18.0423;
param workload[JOB] := <1> 103.9523, <2> 35.8274, <3> 2398.8151, <4> 1267.2532, <5> 2282.6131, <6> 1189.9326, <7> 781.2305, <8> 1548.0369, <9> 151.5139, <10> 325.5246;
param capacity[MACHINE] := <1> 2521.1749, <2> 2521.1749, <3> 2521.1749;

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
