set JOB := {1 .. 20};
set MACHINE := {1 .. 7};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 17.9622, <2> 3.7656, <3> 37.7168, <4> 47.3409, <5> 21.0469, <6> 21.9864, <7> 4.5717, <8> 43.0252, <9> 27.4821, <10> 7.1282, <11> 19.2082, <12> 35.1871, <13> 45.7066, <14> 15.8195, <15> 25.4054, <16> 41.4716, <17> 39.5595, <18> 13.2295, <19> 14.6698, <20> 40.8959;
param workload[JOB] := <1> 4.2382, <2> 1.9405, <3> 6.1414, <4> 6.8805, <5> 4.5877, <6> 4.689, <7> 2.1382, <8> 6.5594, <9> 5.2423, <10> 2.6699, <11> 4.3827, <12> 5.9319, <13> 6.7607, <14> 3.9774, <15> 5.0404, <16> 6.4398, <17> 6.2896, <18> 3.6372, <19> 3.8301, <20> 6.395;
param capacity[MACHINE] := <1> 13.9674, <2> 13.9674, <3> 13.9674, <4> 13.9674, <5> 13.9674, <6> 13.9674, <7> 13.9674;

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
