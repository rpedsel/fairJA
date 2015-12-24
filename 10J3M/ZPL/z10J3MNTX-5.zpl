set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 39.9638, <2> 24.3476, <3> 19.971, <4> 26.6067, <5> 25.5343, <6> 24.8434, <7> 28.1216, <8> 28.0291, <9> 23.4525, <10> 21.3385;
param workload[JOB] := <1> 6.3217, <2> 4.9343, <3> 4.4689, <4> 5.1582, <5> 5.0531, <6> 4.9843, <7> 5.303, <8> 5.2943, <9> 4.8428, <10> 4.6194;
param capacity[MACHINE] := <1> 12.745, <2> 12.745, <3> 12.745;

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
