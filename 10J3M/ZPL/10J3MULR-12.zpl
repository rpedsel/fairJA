set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 37.2234, <2> 45.8782, <3> 34.9994, <4> 37.6933, <5> 44.8113, <6> 31.4575, <7> 37.9289, <8> 8.3402, <9> 8.0108, <10> 27.8746;
param workload[JOB] := <1> 16.3902, <2> 31.1418, <3> 8.9432, <4> 49.5504, <5> 13.9244, <6> 1.9371, <7> 1.1667, <8> 4.6482, <9> 48.9921, <10> 31.6599;
param capacity[MACHINE] := <1> 69.4513, <2> 69.4513, <3> 69.4513;

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
