set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 21.8407, <2> 26.9692, <3> 27.5521, <4> 24.4333, <5> 23.3681, <6> 23.8759, <7> 24.0841, <8> 14.5133, <9> 26.8725, <10> 31.2627;
param workload[JOB] := <1> 21.8407, <2> 26.9692, <3> 27.5521, <4> 24.4333, <5> 23.3681, <6> 23.8759, <7> 24.0841, <8> 14.5133, <9> 26.8725, <10> 31.2627;
param capacity[MACHINE] := <1> 244.7719, <2> 244.7719, <3> 244.7719;

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
