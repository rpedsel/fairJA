set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 31.7236, <2> 26.9569, <3> 28.2149, <4> 24.1382, <5> 25.2957, <6> 32.1309, <7> 22.9701, <8> 32.5798, <9> 23.2488, <10> 26.5615;
param workload[JOB] := <1> 1006.3868, <2> 726.6745, <3> 796.0806, <4> 582.6527, <5> 639.8724, <6> 1032.3947, <7> 527.6255, <8> 1061.4434, <9> 540.5067, <10> 705.5133;
param capacity[MACHINE] := <1> 2539.7169, <2> 2539.7169, <3> 2539.7169;

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
