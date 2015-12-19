set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 35.7398, <2> 29.3323, <3> 48.8935, <4> 16.6524, <5> 27.8929, <6> 8.04, <7> 5.784, <8> 1.3876, <9> 39.6608, <10> 30.5725;
param workload[JOB] := <1> 45.0122, <2> 11.5205, <3> 43.5564, <4> 5.6867, <5> 23.6676, <6> 34.4744, <7> 46.2287, <8> 40.9105, <9> 5.3087, <10> 19.2624;
param capacity[MACHINE] := <1> 275.6281, <2> 275.6281, <3> 275.6281;

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
