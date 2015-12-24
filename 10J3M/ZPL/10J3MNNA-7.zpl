set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 21.7345, <2> 28.1711, <3> 20.1814, <4> 22.7243, <5> 28.0423, <6> 21.6698, <7> 16.9159, <8> 28.3419, <9> 22.4757, <10> 25.8898;
param workload[JOB] := <1> 472.3885, <2> 793.6109, <3> 407.2889, <4> 516.3938, <5> 786.3706, <6> 469.5802, <7> 286.1477, <8> 803.2633, <9> 505.1571, <10> 670.2817;
param capacity[MACHINE] := <1> 5710.4827, <2> 5710.4827, <3> 5710.4827;

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
