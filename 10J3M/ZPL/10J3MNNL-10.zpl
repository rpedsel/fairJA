set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 28.6073, <2> 23.6726, <3> 20.8538, <4> 25.545, <5> 29.2181, <6> 24.7247, <7> 23.9365, <8> 27.6281, <9> 26.4561, <10> 23.1003;
param workload[JOB] := <1> 28.6073, <2> 23.6726, <3> 20.8538, <4> 25.545, <5> 29.2181, <6> 24.7247, <7> 23.9365, <8> 27.6281, <9> 26.4561, <10> 23.1003;
param capacity[MACHINE] := <1> 253.7425, <2> 253.7425, <3> 253.7425;

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
