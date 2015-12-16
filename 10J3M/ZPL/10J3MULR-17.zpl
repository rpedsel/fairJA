set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 41.1148, <2> 0.7082, <3> 33.6214, <4> 22.417, <5> 27.1646, <6> 21.2877, <7> 48.2366, <8> 38.3132, <9> 2.0429, <10> 17.154;
param workload[JOB] := <1> 17.8798, <2> 27.0648, <3> 49.3804, <4> 19.6795, <5> 23.6454, <6> 17.059, <7> 11.7212, <8> 26.617, <9> 29.7379, <10> 35.6206;
param capacity[MACHINE] := <1> 86.1352, <2> 86.1352, <3> 86.1352;

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
