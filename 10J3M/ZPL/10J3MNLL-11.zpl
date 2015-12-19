set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 21.3899, <2> 25.1722, <3> 22.8292, <4> 24.6461, <5> 21.7983, <6> 19.1417, <7> 27.2342, <8> 24.817, <9> 26.0841, <10> 24.2324;
param workload[JOB] := <1> 21.3899, <2> 25.1722, <3> 22.8292, <4> 24.6461, <5> 21.7983, <6> 19.1417, <7> 27.2342, <8> 24.817, <9> 26.0841, <10> 24.2324;
param capacity[MACHINE] := <1> 79.115, <2> 79.115, <3> 79.115;

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
