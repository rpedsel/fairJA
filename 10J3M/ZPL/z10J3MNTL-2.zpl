set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 30.8036, <2> 28.5561, <3> 23.0934, <4> 30.8, <5> 26.8344, <6> 23.1036, <7> 26.4463, <8> 27.4807, <9> 18.0632, <10> 18.6668;
param workload[JOB] := <1> 30.8036, <2> 28.5561, <3> 23.0934, <4> 30.8, <5> 26.8344, <6> 23.1036, <7> 26.4463, <8> 27.4807, <9> 18.0632, <10> 18.6668;
param capacity[MACHINE] := <1> 63.462, <2> 63.462, <3> 63.462;

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
