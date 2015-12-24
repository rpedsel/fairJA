set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 23.9974, <2> 19.0251, <3> 24.994, <4> 30.145, <5> 28.3413, <6> 23.5133, <7> 14.2232, <8> 24.0704, <9> 18.086, <10> 24.6953;
param workload[JOB] := <1> 4.8987, <2> 4.3618, <3> 4.9994, <4> 5.4904, <5> 5.3237, <6> 4.8491, <7> 3.7714, <8> 4.9062, <9> 4.2528, <10> 4.9694;
param capacity[MACHINE] := <1> 47.8229, <2> 47.8229, <3> 47.8229;

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
