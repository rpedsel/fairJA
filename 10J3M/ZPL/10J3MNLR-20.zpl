set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 25.8819, <2> 28.6124, <3> 23.0051, <4> 33.424, <5> 24.7137, <6> 29.8, <7> 19.739, <8> 29.217, <9> 27.5514, <10> 20.9047;
param workload[JOB] := <1> 12.0832, <2> 41.3616, <3> 17.3717, <4> 7.642, <5> 5.9951, <6> 7.1632, <7> 29.0857, <8> 39.6685, <9> 9.5264, <10> 34.2858;
param capacity[MACHINE] := <1> 68.0611, <2> 68.0611, <3> 68.0611;

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
