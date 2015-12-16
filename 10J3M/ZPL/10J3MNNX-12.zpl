set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 18.5202, <2> 30.6444, <3> 33.9453, <4> 24.0613, <5> 25.5719, <6> 29.6896, <7> 38.9799, <8> 25.4955, <9> 23.4514, <10> 20.2605;
param workload[JOB] := <1> 4.3035, <2> 5.5357, <3> 5.8263, <4> 4.9052, <5> 5.0569, <6> 5.4488, <7> 6.2434, <8> 5.0493, <9> 4.8427, <10> 4.5012;
param capacity[MACHINE] := <1> 51.713, <2> 51.713, <3> 51.713;

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
