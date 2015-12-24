set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 19.5143, <2> 21.263, <3> 23.579, <4> 23.6288, <5> 30.4691, <6> 35.4054, <7> 25.7931, <8> 30.1898, <9> 28.7463, <10> 32.8172;
param workload[JOB] := <1> 4.4175, <2> 4.6112, <3> 4.8558, <4> 4.8609, <5> 5.5199, <6> 5.9502, <7> 5.0787, <8> 5.4945, <9> 5.3616, <10> 5.7286;
param capacity[MACHINE] := <1> 51.8789, <2> 51.8789, <3> 51.8789;

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
