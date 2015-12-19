set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 29.0146, <2> 18.8004, <3> 34.2134, <4> 28.9688, <5> 29.5068, <6> 22.5696, <7> 31.8224, <8> 26.9287, <9> 23.1915, <10> 33.3848;
param workload[JOB] := <1> 29.0146, <2> 18.8004, <3> 34.2134, <4> 28.9688, <5> 29.5068, <6> 22.5696, <7> 31.8224, <8> 26.9287, <9> 23.1915, <10> 33.3848;
param capacity[MACHINE] := <1> 92.8003, <2> 92.8003, <3> 92.8003;

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
