set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 44.5228, <2> 21.7861, <3> 48.3698, <4> 10.7567, <5> 46.0797, <6> 39.1729, <7> 0.7103, <8> 17.6964, <9> 41.7752, <10> 17.6759;
param workload[JOB] := <1> 1982.2797, <2> 474.6342, <3> 2339.6376, <4> 115.7066, <5> 2123.3388, <6> 1534.5161, <7> 0.5045, <8> 313.1626, <9> 1745.1673, <10> 312.4374;
param capacity[MACHINE] := <1> 10941.3848, <2> 10941.3848, <3> 10941.3848;

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
