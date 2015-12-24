set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 21.0405, <2> 26.8973, <3> 30.0965, <4> 19.5031, <5> 26.4174, <6> 16.4921, <7> 37.4417, <8> 26.5443, <9> 31.143, <10> 29.2117;
param workload[JOB] := <1> 40.9391, <2> 8.6485, <3> 39.7785, <4> 37.8326, <5> 0.453, <6> 15.954, <7> 21.9132, <8> 47.217, <9> 17.5291, <10> 0.5279;
param capacity[MACHINE] := <1> 57.6983, <2> 57.6983, <3> 57.6983;

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
