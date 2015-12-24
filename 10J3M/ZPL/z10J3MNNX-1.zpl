set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 26.7695, <2> 30.2991, <3> 25.6767, <4> 33.835, <5> 24.2728, <6> 29.272, <7> 30.1138, <8> 23.9369, <9> 16.546, <10> 32.7403;
param workload[JOB] := <1> 5.1739, <2> 5.5045, <3> 5.0672, <4> 5.8168, <5> 4.9267, <6> 5.4104, <7> 5.4876, <8> 4.8925, <9> 4.0677, <10> 5.7219;
param capacity[MACHINE] := <1> 52.0692, <2> 52.0692, <3> 52.0692;

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
