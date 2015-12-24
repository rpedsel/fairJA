set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 9.5567, <2> 12.3311, <3> 9.9339, <4> 39.0294, <5> 42.2695, <6> 39.273, <7> 9.3262, <8> 13.7667, <9> 43.4591, <10> 33.1025;
param workload[JOB] := <1> 32.994, <2> 40.9853, <3> 8.3484, <4> 49.5028, <5> 37.3896, <6> 27.0286, <7> 19.2292, <8> 27.2548, <9> 48.551, <10> 46.7088;
param capacity[MACHINE] := <1> 337.9925, <2> 337.9925, <3> 337.9925;

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
