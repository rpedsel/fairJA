set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 21.1232, <2> 25.1502, <3> 18.1662, <4> 1.7465, <5> 31.4097, <6> 45.2699, <7> 45.6257, <8> 28.2589, <9> 34.5441, <10> 46.9197;
param workload[JOB] := <1> 4.596, <2> 5.015, <3> 4.2622, <4> 1.3216, <5> 5.6044, <6> 6.7283, <7> 6.7547, <8> 5.3159, <9> 5.8774, <10> 6.8498;
param capacity[MACHINE] := <1> 13.0814, <2> 13.0814, <3> 13.0814;

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
