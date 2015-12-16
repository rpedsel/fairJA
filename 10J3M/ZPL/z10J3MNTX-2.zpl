set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 29.589, <2> 28.3352, <3> 25.4777, <4> 26.4326, <5> 17.6139, <6> 23.5596, <7> 23.7736, <8> 20.4497, <9> 17.9325, <10> 27.3918;
param workload[JOB] := <1> 5.4396, <2> 5.3231, <3> 5.0475, <4> 5.1413, <5> 4.1969, <6> 4.8538, <7> 4.8758, <8> 4.5221, <9> 4.2347, <10> 5.2337;
param capacity[MACHINE] := <1> 12.2171, <2> 12.2171, <3> 12.2171;

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
