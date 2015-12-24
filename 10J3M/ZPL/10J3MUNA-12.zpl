set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 27.1103, <2> 0.6801, <3> 32.1773, <4> 14.6947, <5> 45.2201, <6> 36.3898, <7> 34.3094, <8> 15.7722, <9> 44.7483, <10> 23.8463;
param workload[JOB] := <1> 734.9684, <2> 0.4625, <3> 1035.3786, <4> 215.9342, <5> 2044.8574, <6> 1324.2175, <7> 1177.1349, <8> 248.7623, <9> 2002.4104, <10> 568.646;
param capacity[MACHINE] := <1> 9352.7722, <2> 9352.7722, <3> 9352.7722;

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
