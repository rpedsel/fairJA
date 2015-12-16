set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 26.3968, <2> 22.2717, <3> 19.7755, <4> 32.1878, <5> 19.8693, <6> 34.1459, <7> 20.9421, <8> 21.9753, <9> 28.0026, <10> 31.0239;
param workload[JOB] := <1> 26.3968, <2> 22.2717, <3> 19.7755, <4> 32.1878, <5> 19.8693, <6> 34.1459, <7> 20.9421, <8> 21.9753, <9> 28.0026, <10> 31.0239;
param capacity[MACHINE] := <1> 256.5909, <2> 256.5909, <3> 256.5909;

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
