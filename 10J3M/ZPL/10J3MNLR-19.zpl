set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 25.2061, <2> 25.3003, <3> 23.811, <4> 24.7396, <5> 20.5215, <6> 30.1725, <7> 38.9679, <8> 25.3803, <9> 28.1926, <10> 27.774;
param workload[JOB] := <1> 39.2701, <2> 6.1502, <3> 40.9101, <4> 45.9541, <5> 37.9455, <6> 23.5371, <7> 25.3478, <8> 31.4145, <9> 34.171, <10> 45.9041;
param capacity[MACHINE] := <1> 110.2015, <2> 110.2015, <3> 110.2015;

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
