set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 36.5362, <2> 21.6845, <3> 49.0572, <4> 17.3094, <5> 19.6214, <6> 13.4913, <7> 35.7283, <8> 22.5038, <9> 12.8178, <10> 7.8284;
param workload[JOB] := <1> 6.0445, <2> 4.6567, <3> 7.0041, <4> 4.1605, <5> 4.4296, <6> 3.6731, <7> 5.9773, <8> 4.7438, <9> 3.5802, <10> 2.7979;
param capacity[MACHINE] := <1> 47.0677, <2> 47.0677, <3> 47.0677;

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
