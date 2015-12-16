set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 20.8881, <2> 23.5137, <3> 18.4676, <4> 34.4172, <5> 25.9452, <6> 30.8523, <7> 29.2042, <8> 24.4137, <9> 24.1501, <10> 22.9726;
param workload[JOB] := <1> 4.5704, <2> 4.8491, <3> 4.2974, <4> 5.8666, <5> 5.0936, <6> 5.5545, <7> 5.4041, <8> 4.941, <9> 4.9143, <10> 4.793;
param capacity[MACHINE] := <1> 50.284, <2> 50.284, <3> 50.284;

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
