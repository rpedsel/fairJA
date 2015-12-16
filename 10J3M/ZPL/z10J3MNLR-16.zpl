set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 24.2866, <2> 25.4255, <3> 29.8362, <4> 29.1927, <5> 31.4395, <6> 21.7465, <7> 27.6603, <8> 19.2393, <9> 26.2152, <10> 32.2022;
param workload[JOB] := <1> 32.3555, <2> 13.9349, <3> 10.1699, <4> 22.4174, <5> 37.1775, <6> 7.0969, <7> 19.7941, <8> 43.4322, <9> 21.825, <10> 22.3163;
param capacity[MACHINE] := <1> 76.8399, <2> 76.8399, <3> 76.8399;

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
