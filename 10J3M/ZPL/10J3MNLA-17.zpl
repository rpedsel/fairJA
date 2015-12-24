set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 26.3081, <2> 32.7428, <3> 16.7984, <4> 14.1291, <5> 32.9668, <6> 29.8278, <7> 25.6323, <8> 35.0617, <9> 43.4169, <10> 18.8038;
param workload[JOB] := <1> 692.1161, <2> 1072.091, <3> 282.1862, <4> 199.6315, <5> 1086.8099, <6> 889.6977, <7> 657.0148, <8> 1229.3228, <9> 1885.0272, <10> 353.5829;
param capacity[MACHINE] := <1> 2782.4934, <2> 2782.4934, <3> 2782.4934;

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
