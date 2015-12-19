set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 16.9853, <2> 43.3245, <3> 29.5775, <4> 37.7408, <5> 45.3768, <6> 15.674, <7> 46.9126, <8> 2.4811, <9> 15.6863, <10> 24.5147;
param workload[JOB] := <1> 39.0696, <2> 3.6409, <3> 25.5622, <4> 44.8283, <5> 4.7441, <6> 29.8291, <7> 42.1763, <8> 10.9395, <9> 42.6513, <10> 10.5903;
param capacity[MACHINE] := <1> 254.0316, <2> 254.0316, <3> 254.0316;

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
