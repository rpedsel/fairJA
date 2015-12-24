set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 23.025, <2> 22.8758, <3> 48.0008, <4> 43.5118, <5> 18.6652, <6> 18.7737, <7> 8.4731, <8> 34.8803, <9> 38.9211, <10> 7.9896;
param workload[JOB] := <1> 4.7984, <2> 4.7829, <3> 6.9283, <4> 6.5963, <5> 4.3203, <6> 4.3329, <7> 2.9109, <8> 5.906, <9> 6.2387, <10> 2.8266;
param capacity[MACHINE] := <1> 49.6413, <2> 49.6413, <3> 49.6413;

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
