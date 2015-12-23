set JOB := {1 .. 20};
set MACHINE := {1 .. 7};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 18.5337, <2> 29.8051, <3> 31.8912, <4> 26.5701, <5> 20.378, <6> 29.9923, <7> 28.7777, <8> 30.6206, <9> 24.3575, <10> 30.4627, <11> 26.8292, <12> 28.8251, <13> 23.5607, <14> 28.9294, <15> 15.1353, <16> 23.6425, <17> 23.9495, <18> 24.8358, <19> 22.1281, <20> 31.4482;
param workload[JOB] := <1> 33.862, <2> 49.8271, <3> 10.781, <4> 16.3673, <5> 7.1775, <6> 44.0328, <7> 17.7313, <8> 45.5695, <9> 41.4472, <10> 37.1889, <11> 1.9235, <12> 36.408, <13> 39.8608, <14> 24.4819, <15> 20.143, <16> 41.1106, <17> 1.0095, <18> 33.8577, <19> 16.4165, <20> 19.1539;
param capacity[MACHINE] := <1> 538.35, <2> 538.35, <3> 538.35, <4> 538.35, <5> 538.35, <6> 538.35, <7> 538.35;

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
