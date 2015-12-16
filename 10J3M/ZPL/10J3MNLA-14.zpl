set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 21.9293, <2> 26.0114, <3> 24.0319, <4> 33.2313, <5> 27.3447, <6> 16.7839, <7> 26.7541, <8> 34.4396, <9> 24.3075, <10> 29.2677;
param workload[JOB] := <1> 480.8942, <2> 676.5929, <3> 577.5322, <4> 1104.3193, <5> 747.7326, <6> 281.6993, <7> 715.7819, <8> 1186.086, <9> 590.8546, <10> 856.5983;
param capacity[MACHINE] := <1> 2406.0304, <2> 2406.0304, <3> 2406.0304;

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
