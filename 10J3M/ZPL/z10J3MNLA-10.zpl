set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 26.6888, <2> 27.7896, <3> 27.1844, <4> 18.698, <5> 25.111, <6> 21.5908, <7> 27.4749, <8> 21.995, <9> 21.9205, <10> 29.2993;
param workload[JOB] := <1> 712.292, <2> 772.2619, <3> 738.9916, <4> 349.6152, <5> 630.5623, <6> 466.1626, <7> 754.8701, <8> 483.78, <9> 480.5083, <10> 858.449;
param capacity[MACHINE] := <1> 2082.4977, <2> 2082.4977, <3> 2082.4977;

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
