set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 36.4723, <2> 47.9966, <3> 30.0135, <4> 11.6995, <5> 5.1995, <6> 35.4959, <7> 1.5283, <8> 43.2745, <9> 32.3893, <10> 23.2007;
param workload[JOB] := <1> 17.3382, <2> 33.8784, <3> 16.6723, <4> 24.9376, <5> 40.5437, <6> 14.6473, <7> 12.923, <8> 11.6012, <9> 22.7891, <10> 2.7876;
param capacity[MACHINE] := <1> 66.0395, <2> 66.0395, <3> 66.0395;

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
