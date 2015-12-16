set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 22.1915, <2> 21.8496, <3> 19.425, <4> 29.6433, <5> 24.4545, <6> 21.0853, <7> 23.0114, <8> 21.0167, <9> 19.2834, <10> 12.8389;
param workload[JOB] := <1> 4.7108, <2> 4.6744, <3> 4.4074, <4> 5.4446, <5> 4.9451, <6> 4.5919, <7> 4.797, <8> 4.5844, <9> 4.3913, <10> 3.5831;
param capacity[MACHINE] := <1> 15.3767, <2> 15.3767, <3> 15.3767;

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
