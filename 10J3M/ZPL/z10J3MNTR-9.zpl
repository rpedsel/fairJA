set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 26.0597, <2> 26.6134, <3> 24.64, <4> 20.6099, <5> 27.0998, <6> 28.9708, <7> 18.7454, <8> 20.1289, <9> 25.8315, <10> 26.3824;
param workload[JOB] := <1> 38.1489, <2> 40.9899, <3> 28.6724, <4> 15.8374, <5> 47.021, <6> 2.8115, <7> 19.1909, <8> 16.798, <9> 6.2929, <10> 46.747;
param capacity[MACHINE] := <1> 65.6275, <2> 65.6275, <3> 65.6275;

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
