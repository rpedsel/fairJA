set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 21.6091, <2> 26.8406, <3> 25.137, <4> 33.3627, <5> 28.7703, <6> 25.3263, <7> 29.7914, <8> 26.3762, <9> 19.2081, <10> 24.2262;
param workload[JOB] := <1> 21.6091, <2> 26.8406, <3> 25.137, <4> 33.3627, <5> 28.7703, <6> 25.3263, <7> 29.7914, <8> 26.3762, <9> 19.2081, <10> 24.2262;
param capacity[MACHINE] := <1> 260.6479, <2> 260.6479, <3> 260.6479;

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
