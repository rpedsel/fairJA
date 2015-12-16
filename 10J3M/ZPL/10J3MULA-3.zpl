set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 26.6574, <2> 30.856, <3> 29.0534, <4> 26.1419, <5> 49.3579, <6> 10.8086, <7> 34.5701, <8> 31.7349, <9> 35.2553, <10> 0.5907;
param workload[JOB] := <1> 710.617, <2> 952.0927, <3> 844.1001, <4> 683.3989, <5> 2436.2023, <6> 116.8258, <7> 1195.0918, <8> 1007.1039, <9> 1242.9362, <10> 0.3489;
param capacity[MACHINE] := <1> 3062.9059, <2> 3062.9059, <3> 3062.9059;

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
