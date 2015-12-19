set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 27.5068, <2> 30.7546, <3> 19.3262, <4> 17.9206, <5> 29.316, <6> 26.1349, <7> 19.1161, <8> 32.0657, <9> 29.056, <10> 27.0623;
param workload[JOB] := <1> 756.624, <2> 945.8454, <3> 373.502, <4> 321.1479, <5> 859.4279, <6> 683.033, <7> 365.4253, <8> 1028.2091, <9> 844.2511, <10> 732.3681;
param capacity[MACHINE] := <1> 2303.2779, <2> 2303.2779, <3> 2303.2779;

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
