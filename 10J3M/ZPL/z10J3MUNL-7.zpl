set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 27.4725, <2> 35.3822, <3> 42.6485, <4> 35.6546, <5> 0.6446, <6> 27.6508, <7> 5.0453, <8> 20.8874, <9> 3.0882, <10> 13.0293;
param workload[JOB] := <1> 27.4725, <2> 35.3822, <3> 42.6485, <4> 35.6546, <5> 0.6446, <6> 27.6508, <7> 5.0453, <8> 20.8874, <9> 3.0882, <10> 13.0293;
param capacity[MACHINE] := <1> 211.5034, <2> 211.5034, <3> 211.5034;

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
