set JOB := {1 .. 20};
set MACHINE := {1 .. 7};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 19.4968, <2> 31.5056, <3> 20.2716, <4> 20.6287, <5> 18.9478, <6> 27.3795, <7> 26.8929, <8> 34.1799, <9> 23.2474, <10> 32.5477, <11> 24.0648, <12> 31.8261, <13> 15.5019, <14> 19.8951, <15> 18.6775, <16> 34.0421, <17> 26.8891, <18> 19.9733, <19> 22.2198, <20> 21.5202;
param workload[JOB] := <1> 380.1252, <2> 992.6028, <3> 410.9378, <4> 425.5433, <5> 359.0191, <6> 749.637, <7> 723.2281, <8> 1168.2656, <9> 540.4416, <10> 1059.3528, <11> 579.1146, <12> 1012.9006, <13> 240.3089, <14> 395.815, <15> 348.849, <16> 1158.8646, <17> 723.0237, <18> 398.9327, <19> 493.7195, <20> 463.119;
param capacity[MACHINE] := <1> 12623.8009, <2> 12623.8009, <3> 12623.8009, <4> 12623.8009, <5> 12623.8009, <6> 12623.8009, <7> 12623.8009;

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
