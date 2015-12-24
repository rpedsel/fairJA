set JOB := {1 .. 20};
set MACHINE := {1 .. 7};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 45.3032, <2> 44.5166, <3> 26.5786, <4> 42.9956, <5> 35.8758, <6> 3.5387, <7> 1.4301, <8> 33.7091, <9> 11.0407, <10> 21.8768, <11> 13.0758, <12> 38.3029, <13> 26.8879, <14> 45.775, <15> 42.1926, <16> 43.5678, <17> 18.8838, <18> 26.0512, <19> 4.1181, <20> 7.5127;
param workload[JOB] := <1> 24.8621, <2> 23.6836, <3> 23.0058, <4> 20.6813, <5> 5.4466, <6> 33.12, <7> 22.8088, <8> 0.4963, <9> 0.7853, <10> 38.1472, <11> 34.4502, <12> 16.9036, <13> 5.5909, <14> 44.8497, <15> 30.1341, <16> 31.0343, <17> 0.638, <18> 35.5114, <19> 26.128, <20> 36.4315;
param capacity[MACHINE] := <1> 48.7188, <2> 48.7188, <3> 48.7188, <4> 48.7188, <5> 48.7188, <6> 48.7188, <7> 48.7188;

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
