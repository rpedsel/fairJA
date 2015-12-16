set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 13.8204, <2> 31.467, <3> 18.1471, <4> 28.1072, <5> 26.6486, <6> 17.7727, <7> 29.0085, <8> 22.7192, <9> 19.8717, <10> 27.2621;
param workload[JOB] := <1> 3.7176, <2> 5.6095, <3> 4.2599, <4> 5.3016, <5> 5.1622, <6> 4.2158, <7> 5.386, <8> 4.7665, <9> 4.4578, <10> 5.2213;
param capacity[MACHINE] := <1> 48.0982, <2> 48.0982, <3> 48.0982;

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
