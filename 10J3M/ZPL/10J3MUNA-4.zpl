set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 1.1612, <2> 29.0665, <3> 22.5966, <4> 8.8326, <5> 37.1742, <6> 49.9654, <7> 8.9052, <8> 22.3713, <9> 25.0318, <10> 43.6928;
param workload[JOB] := <1> 1.3484, <2> 844.8614, <3> 510.6063, <4> 78.0148, <5> 1381.9211, <6> 2496.5412, <7> 79.3026, <8> 500.4751, <9> 626.591, <10> 1909.0608;
param capacity[MACHINE] := <1> 8428.7227, <2> 8428.7227, <3> 8428.7227;

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
