set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 39.7954, <2> 29.7869, <3> 42.9624, <4> 31.8061, <5> 22.9536, <6> 20.2672, <7> 46.7856, <8> 20.5531, <9> 12.4917, <10> 40.3306;
param workload[JOB] := <1> 39.7954, <2> 29.7869, <3> 42.9624, <4> 31.8061, <5> 22.9536, <6> 20.2672, <7> 46.7856, <8> 20.5531, <9> 12.4917, <10> 40.3306;
param capacity[MACHINE] := <1> 76.9331, <2> 76.9331, <3> 76.9331;

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
