set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 28.9083, <2> 22.2274, <3> 30.9287, <4> 32.8597, <5> 25.8166, <6> 26.8251, <7> 18.995, <8> 18.2201, <9> 23.4157, <10> 25.3291;
param workload[JOB] := <1> 28.9083, <2> 22.2274, <3> 30.9287, <4> 32.8597, <5> 25.8166, <6> 26.8251, <7> 18.995, <8> 18.2201, <9> 23.4157, <10> 25.3291;
param capacity[MACHINE] := <1> 84.5086, <2> 84.5086, <3> 84.5086;

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
