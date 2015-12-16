set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 18.624, <2> 31.1309, <3> 25.4612, <4> 26.4278, <5> 31.132, <6> 34.4593, <7> 25.8187, <8> 13.2479, <9> 24.1882, <10> 30.3474;
param workload[JOB] := <1> 18.624, <2> 31.1309, <3> 25.4612, <4> 26.4278, <5> 31.132, <6> 34.4593, <7> 25.8187, <8> 13.2479, <9> 24.1882, <10> 30.3474;
param capacity[MACHINE] := <1> 86.9458, <2> 86.9458, <3> 86.9458;

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
