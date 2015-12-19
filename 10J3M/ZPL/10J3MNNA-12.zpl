set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 13.5864, <2> 29.7418, <3> 21.7547, <4> 18.1777, <5> 31.1763, <6> 21.2999, <7> 26.4853, <8> 25.6114, <9> 28.0053, <10> 24.0809;
param workload[JOB] := <1> 184.5903, <2> 884.5747, <3> 473.267, <4> 330.4288, <5> 971.9617, <6> 453.6857, <7> 701.4711, <8> 655.9438, <9> 784.2968, <10> 579.8897;
param capacity[MACHINE] := <1> 6020.1096, <2> 6020.1096, <3> 6020.1096;

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
