set JOB := {1 .. 20};
set MACHINE := {1 .. 6};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 38.6497, <2> 0.9113, <3> 13.3308, <4> 17.9438, <5> 2.9868, <6> 49.6676, <7> 18.9635, <8> 39.2072, <9> 8.0806, <10> 10.2333, <11> 11.3579, <12> 5.2413, <13> 5.6044, <14> 19.016, <15> 21.1994, <16> 37.8534, <17> 34.4658, <18> 48.5483, <19> 35.7144, <20> 31.9482;
param workload[JOB] := <1> 4.4235, <2> 20.1963, <3> 23.502, <4> 5.3477, <5> 6.2466, <6> 9.4454, <7> 2.7201, <8> 38.252, <9> 24.4487, <10> 23.5389, <11> 40.6919, <12> 1.9208, <13> 4.512, <14> 22.52, <15> 34.9598, <16> 45.7351, <17> 37.7083, <18> 17.3926, <19> 10.6299, <20> 17.2755;
param capacity[MACHINE] := <1> 65.2445, <2> 65.2445, <3> 65.2445, <4> 65.2445, <5> 65.2445, <6> 65.2445;

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
