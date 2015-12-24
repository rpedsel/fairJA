set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 17.8024, <2> 46.9903, <3> 40.4318, <4> 32.7583, <5> 49.5673, <6> 0.003, <7> 9.6848, <8> 20.4936, <9> 20.0137, <10> 36.3539;
param workload[JOB] := <1> 4.2193, <2> 6.8549, <3> 6.3586, <4> 5.7235, <5> 7.0404, <6> 0.0548, <7> 3.112, <8> 4.527, <9> 4.4737, <10> 6.0294;
param capacity[MACHINE] := <1> 12.0984, <2> 12.0984, <3> 12.0984;

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
