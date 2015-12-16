set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 31.6611, <2> 32.1814, <3> 26.9781, <4> 28.84, <5> 19.1682, <6> 30.0484, <7> 24.5083, <8> 23.8459, <9> 30.0525, <10> 21.8285;
param workload[JOB] := <1> 31.6611, <2> 32.1814, <3> 26.9781, <4> 28.84, <5> 19.1682, <6> 30.0484, <7> 24.5083, <8> 23.8459, <9> 30.0525, <10> 21.8285;
param capacity[MACHINE] := <1> 67.2781, <2> 67.2781, <3> 67.2781;

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
