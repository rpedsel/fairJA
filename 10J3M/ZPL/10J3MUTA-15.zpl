set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 39.0068, <2> 39.8228, <3> 12.289, <4> 9.6256, <5> 13.0055, <6> 41.5486, <7> 47.5538, <8> 45.3379, <9> 3.3531, <10> 25.941;
param workload[JOB] := <1> 1521.5304, <2> 1585.8554, <3> 151.0195, <4> 92.6522, <5> 169.143, <6> 1726.2862, <7> 2261.3639, <8> 2055.5252, <9> 11.2433, <10> 672.9355;
param capacity[MACHINE] := <1> 2561.8886, <2> 2561.8886, <3> 2561.8886;

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
