set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 45.3299, <2> 23.0911, <3> 17.952, <4> 12.8658, <5> 30.9875, <6> 11.8326, <7> 28.8387, <8> 11.3919, <9> 48.6733, <10> 45.6141;
param workload[JOB] := <1> 6.7327, <2> 4.8053, <3> 4.237, <4> 3.5869, <5> 5.5666, <6> 3.4399, <7> 5.3702, <8> 3.3752, <9> 6.9766, <10> 6.7538;
param capacity[MACHINE] := <1> 50.8442, <2> 50.8442, <3> 50.8442;

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
