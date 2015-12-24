set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 22.1129, <2> 46.3257, <3> 34.4453, <4> 48.1641, <5> 42.3201, <6> 36.3519, <7> 24.3188, <8> 0.5372, <9> 47.9944, <10> 22.9425;
param workload[JOB] := <1> 9.6114, <2> 42.699, <3> 17.2688, <4> 22.83, <5> 42.0667, <6> 47.9214, <7> 17.5444, <8> 22.7522, <9> 34.9284, <10> 7.7036;
param capacity[MACHINE] := <1> 88.442, <2> 88.442, <3> 88.442;

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
