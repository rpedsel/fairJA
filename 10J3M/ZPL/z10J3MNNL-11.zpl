set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 25.6425, <2> 21.9406, <3> 22.2226, <4> 20.4844, <5> 24.9588, <6> 25.6674, <7> 19.661, <8> 31.0792, <9> 30.2073, <10> 23.915;
param workload[JOB] := <1> 25.6425, <2> 21.9406, <3> 22.2226, <4> 20.4844, <5> 24.9588, <6> 25.6674, <7> 19.661, <8> 31.0792, <9> 30.2073, <10> 23.915;
param capacity[MACHINE] := <1> 245.7788, <2> 245.7788, <3> 245.7788;

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
