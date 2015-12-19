set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 15.9123, <2> 26.4164, <3> 2.2344, <4> 35.5974, <5> 39.0411, <6> 22.484, <7> 36.5832, <8> 19.9136, <9> 12.1017, <10> 42.1043;
param workload[JOB] := <1> 48.7762, <2> 35.0594, <3> 48.4429, <4> 38.5616, <5> 48.3564, <6> 49.3744, <7> 40.8072, <8> 36.5776, <9> 36.682, <10> 26.6483;
param capacity[MACHINE] := <1> 409.286, <2> 409.286, <3> 409.286;

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
