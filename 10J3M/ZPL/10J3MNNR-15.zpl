set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 23.7614, <2> 31.438, <3> 20.356, <4> 29.6733, <5> 32.243, <6> 17.4288, <7> 28.3107, <8> 23.7442, <9> 18.949, <10> 28.1944;
param workload[JOB] := <1> 8.6032, <2> 23.5287, <3> 30.4459, <4> 33.3786, <5> 37.2579, <6> 42.9806, <7> 32.0636, <8> 18.873, <9> 18.4179, <10> 12.6579;
param capacity[MACHINE] := <1> 258.2073, <2> 258.2073, <3> 258.2073;

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
