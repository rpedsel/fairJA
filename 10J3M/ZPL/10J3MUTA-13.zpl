set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 0.7688, <2> 31.2585, <3> 24.3621, <4> 19.876, <5> 32.8699, <6> 15.2491, <7> 36.0416, <8> 16.8261, <9> 34.8017, <10> 4.2416;
param workload[JOB] := <1> 0.5911, <2> 977.0938, <3> 593.5119, <4> 395.0554, <5> 1080.4303, <6> 232.5351, <7> 1298.9969, <8> 283.1176, <9> 1211.1583, <10> 17.9912;
param capacity[MACHINE] := <1> 1522.6204, <2> 1522.6204, <3> 1522.6204;

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
