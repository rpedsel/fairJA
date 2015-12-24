set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 28.3035, <2> 27.9597, <3> 34.5742, <4> 20.7939, <5> 22.4617, <6> 19.4956, <7> 24.598, <8> 29.7302, <9> 21.2786, <10> 20.2335;
param workload[JOB] := <1> 28.3035, <2> 27.9597, <3> 34.5742, <4> 20.7939, <5> 22.4617, <6> 19.4956, <7> 24.598, <8> 29.7302, <9> 21.2786, <10> 20.2335;
param capacity[MACHINE] := <1> 83.143, <2> 83.143, <3> 83.143;

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
