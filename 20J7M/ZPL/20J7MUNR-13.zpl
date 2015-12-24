set JOB := {1 .. 20};
set MACHINE := {1 .. 7};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 15.5729, <2> 40.2704, <3> 24.7086, <4> 15.6348, <5> 48.2578, <6> 38.5607, <7> 23.0939, <8> 4.2047, <9> 3.5442, <10> 26.183, <11> 45.8418, <12> 29.0835, <13> 21.6679, <14> 13.1671, <15> 15.6746, <16> 33.3891, <17> 11.7818, <18> 42.408, <19> 26.2056, <20> 17.4116;
param workload[JOB] := <1> 4.916, <2> 20.6645, <3> 4.0959, <4> 7.654, <5> 8.2616, <6> 34.6341, <7> 20.6237, <8> 0.0005, <9> 4.8114, <10> 28.4531, <11> 32.3034, <12> 43.5521, <13> 48.4133, <14> 43.8071, <15> 29.7846, <16> 9.822, <17> 36.4039, <18> 2.5955, <19> 13.4457, <20> 31.0876;
param capacity[MACHINE] := <1> 425.33, <2> 425.33, <3> 425.33, <4> 425.33, <5> 425.33, <6> 425.33, <7> 425.33;

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
