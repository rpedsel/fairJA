set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 30.4006, <2> 18.4755, <3> 27.2037, <4> 28.4252, <5> 25.06, <6> 28.1728, <7> 25.5657, <8> 19.2624, <9> 24.4596, <10> 22.3907;
param workload[JOB] := <1> 16.8392, <2> 26.1356, <3> 36.0378, <4> 29.1862, <5> 30.2816, <6> 49.7214, <7> 32.8637, <8> 43.868, <9> 27.3194, <10> 33.3445;
param capacity[MACHINE] := <1> 325.5974, <2> 325.5974, <3> 325.5974;

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
