set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 29.763, <2> 27.4848, <3> 19.8294, <4> 26.1271, <5> 21.5087, <6> 21.9646, <7> 22.2867, <8> 21.8351, <9> 26.7729, <10> 23.3405;
param workload[JOB] := <1> 39.3055, <2> 15.1571, <3> 2.6033, <4> 38.4697, <5> 22.3741, <6> 21.1609, <7> 36.2235, <8> 38.8138, <9> 49.9007, <10> 48.1376;
param capacity[MACHINE] := <1> 78.0365, <2> 78.0365, <3> 78.0365;

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
