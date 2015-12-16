set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 12.1597, <2> 10.5764, <3> 40.0054, <4> 40.7726, <5> 44.3992, <6> 2.2348, <7> 37.1626, <8> 7.6346, <9> 17.2038, <10> 13.3682;
param workload[JOB] := <1> 147.8583, <2> 111.8602, <3> 1600.432, <4> 1662.4049, <5> 1971.289, <6> 4.9943, <7> 1381.0588, <8> 58.2871, <9> 295.9707, <10> 178.7088;
param capacity[MACHINE] := <1> 7412.8641, <2> 7412.8641, <3> 7412.8641;

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
