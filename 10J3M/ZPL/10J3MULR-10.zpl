set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 11.0904, <2> 16.5796, <3> 14.9278, <4> 30.8081, <5> 24.3804, <6> 21.2519, <7> 12.2826, <8> 32.4132, <9> 43.1085, <10> 43.5415;
param workload[JOB] := <1> 45.4938, <2> 9.2031, <3> 26.7241, <4> 23.7819, <5> 47.1033, <6> 32.6072, <7> 23.4999, <8> 43.6011, <9> 42.24, <10> 28.3164;
param capacity[MACHINE] := <1> 107.5236, <2> 107.5236, <3> 107.5236;

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
