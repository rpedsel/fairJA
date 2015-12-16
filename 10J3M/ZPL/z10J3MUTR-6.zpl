set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 19.217, <2> 40.6745, <3> 0.5248, <4> 32.4196, <5> 2.4265, <6> 32.6639, <7> 3.7101, <8> 42.0891, <9> 10.3817, <10> 46.4531;
param workload[JOB] := <1> 30.7672, <2> 10.7184, <3> 20.2198, <4> 49.3018, <5> 35.1846, <6> 8.7087, <7> 43.0964, <8> 45.1006, <9> 19.8271, <10> 43.5023;
param capacity[MACHINE] := <1> 76.6067, <2> 76.6067, <3> 76.6067;

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
