set JOB := {1 .. 20};
set MACHINE := {1 .. 7};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 44.6261, <2> 38.803, <3> 38.0407, <4> 49.0924, <5> 42.9735, <6> 39.7813, <7> 4.9245, <8> 16.6811, <9> 44.0624, <10> 10.2967, <11> 35.1319, <12> 33.8868, <13> 0.4918, <14> 5.4974, <15> 44.304, <16> 20.7456, <17> 44.2122, <18> 23.8815, <19> 16.5336, <20> 34.2639;
param workload[JOB] := <1> 44.6261, <2> 38.803, <3> 38.0407, <4> 49.0924, <5> 42.9735, <6> 39.7813, <7> 4.9245, <8> 16.6811, <9> 44.0624, <10> 10.2967, <11> 35.1319, <12> 33.8868, <13> 0.4918, <14> 5.4974, <15> 44.304, <16> 20.7456, <17> 44.2122, <18> 23.8815, <19> 16.5336, <20> 34.2639;
param capacity[MACHINE] := <1> 84.0329, <2> 84.0329, <3> 84.0329, <4> 84.0329, <5> 84.0329, <6> 84.0329, <7> 84.0329;

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
