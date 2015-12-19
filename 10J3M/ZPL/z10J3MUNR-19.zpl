set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 7.0106, <2> 4.9746, <3> 49.9301, <4> 25.738, <5> 30.6424, <6> 21.5419, <7> 36.5429, <8> 27.7506, <9> 48.8522, <10> 15.4248;
param workload[JOB] := <1> 13.3376, <2> 17.4079, <3> 48.0311, <4> 12.4711, <5> 15.626, <6> 30.292, <7> 16.4963, <8> 46.5627, <9> 18.3144, <10> 44.7842;
param capacity[MACHINE] := <1> 263.3233, <2> 263.3233, <3> 263.3233;

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
