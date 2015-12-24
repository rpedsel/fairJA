set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 31.4679, <2> 28.8805, <3> 23.76, <4> 29.4596, <5> 30.1612, <6> 21.9942, <7> 28.1956, <8> 37.9253, <9> 19.5528, <10> 27.7919;
param workload[JOB] := <1> 5.6096, <2> 5.3741, <3> 4.8744, <4> 5.4277, <5> 5.4919, <6> 4.6898, <7> 5.31, <8> 6.1584, <9> 4.4219, <10> 5.2718;
param capacity[MACHINE] := <1> 17.5432, <2> 17.5432, <3> 17.5432;

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
