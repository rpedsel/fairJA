set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 21.7756, <2> 16.5793, <3> 41.8714, <4> 40.3152, <5> 10.4422, <6> 16.515, <7> 11.3942, <8> 27.9203, <9> 46.4431, <10> 38.6627;
param workload[JOB] := <1> 42.9182, <2> 43.0379, <3> 41.4482, <4> 18.698, <5> 5.0516, <6> 23.6154, <7> 16.8313, <8> 15.648, <9> 0.2721, <10> 41.3072;
param capacity[MACHINE] := <1> 248.8279, <2> 248.8279, <3> 248.8279;

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
