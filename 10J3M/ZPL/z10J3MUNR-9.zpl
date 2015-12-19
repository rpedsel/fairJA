set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 32.0365, <2> 14.3267, <3> 41.5883, <4> 35.1817, <5> 17.8678, <6> 38.6482, <7> 22.2853, <8> 34.4347, <9> 29.3594, <10> 45.4311;
param workload[JOB] := <1> 24.1324, <2> 47.9026, <3> 28.2982, <4> 12.3273, <5> 31.2998, <6> 11.0513, <7> 33.5774, <8> 29.0857, <9> 36.6681, <10> 36.6098;
param capacity[MACHINE] := <1> 290.9526, <2> 290.9526, <3> 290.9526;

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
