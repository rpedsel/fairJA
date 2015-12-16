set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 43.7833, <2> 4.1913, <3> 1.345, <4> 1.9089, <5> 32.9428, <6> 1.3246, <7> 33.3885, <8> 47.4252, <9> 13.8541, <10> 39.825;
param workload[JOB] := <1> 43.7833, <2> 4.1913, <3> 1.345, <4> 1.9089, <5> 32.9428, <6> 1.3246, <7> 33.3885, <8> 47.4252, <9> 13.8541, <10> 39.825;
param capacity[MACHINE] := <1> 73.3296, <2> 73.3296, <3> 73.3296;

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
