set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 18.9879, <2> 25.2985, <3> 17.9953, <4> 33.4683, <5> 16.9896, <6> 19.5065, <7> 16.8814, <8> 25.7189, <9> 27.4656, <10> 26.1298;
param workload[JOB] := <1> 4.3575, <2> 5.0298, <3> 4.2421, <4> 5.7852, <5> 4.1218, <6> 4.4166, <7> 4.1087, <8> 5.0714, <9> 5.2408, <10> 5.1117;
param capacity[MACHINE] := <1> 47.4856, <2> 47.4856, <3> 47.4856;

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
