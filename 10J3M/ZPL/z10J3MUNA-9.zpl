set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 16.673, <2> 34.6238, <3> 42.7008, <4> 12.9392, <5> 21.1289, <6> 10.7142, <7> 22.5819, <8> 10.0999, <9> 13.9087, <10> 30.6778;
param workload[JOB] := <1> 277.9889, <2> 1198.8075, <3> 1823.3583, <4> 167.4229, <5> 446.4304, <6> 114.7941, <7> 509.9422, <8> 102.008, <9> 193.4519, <10> 941.1274;
param capacity[MACHINE] := <1> 5775.3316, <2> 5775.3316, <3> 5775.3316;

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
