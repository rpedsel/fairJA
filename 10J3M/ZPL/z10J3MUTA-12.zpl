set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 8.5879, <2> 25.4508, <3> 40.6535, <4> 22.124, <5> 6.8399, <6> 10.1745, <7> 9.5165, <8> 20.9777, <9> 27.9729, <10> 35.8987;
param workload[JOB] := <1> 73.752, <2> 647.7432, <3> 1652.7071, <4> 489.4714, <5> 46.7842, <6> 103.5205, <7> 90.5638, <8> 440.0639, <9> 782.4831, <10> 1288.7167;
param capacity[MACHINE] := <1> 1403.9515, <2> 1403.9515, <3> 1403.9515;

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
