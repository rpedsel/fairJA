set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 7.1984, <2> 7.7838, <3> 10.1261, <4> 16.6124, <5> 3.3011, <6> 41.3204, <7> 27.1722, <8> 48.4845, <9> 19.255, <10> 26.2306;
param workload[JOB] := <1> 7.1984, <2> 7.7838, <3> 10.1261, <4> 16.6124, <5> 3.3011, <6> 41.3204, <7> 27.1722, <8> 48.4845, <9> 19.255, <10> 26.2306;
param capacity[MACHINE] := <1> 207.4845, <2> 207.4845, <3> 207.4845;

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
