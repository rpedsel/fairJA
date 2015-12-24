set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 25.1381, <2> 35.1819, <3> 20.3745, <4> 26.0442, <5> 21.8733, <6> 27.5432, <7> 27.6202, <8> 29.1337, <9> 25.6862, <10> 27.6051;
param workload[JOB] := <1> 22.859, <2> 14.0077, <3> 2.6701, <4> 49.3842, <5> 49.3665, <6> 25.7953, <7> 15.077, <8> 44.4214, <9> 16.8429, <10> 6.5318;
param capacity[MACHINE] := <1> 246.9559, <2> 246.9559, <3> 246.9559;

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
