set JOB := {1 .. 20};
set MACHINE := {1 .. 7};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 30.3356, <2> 29.3295, <3> 38.105, <4> 6.829, <5> 11.6888, <6> 48.9166, <7> 10.0729, <8> 16.6118, <9> 36.4451, <10> 15.45, <11> 37.2102, <12> 8.4797, <13> 48.69, <14> 14.0868, <15> 44.4501, <16> 16.63, <17> 8.2985, <18> 23.3367, <19> 40.3594, <20> 38.6575;
param workload[JOB] := <1> 5.5078, <2> 5.4157, <3> 6.1729, <4> 2.6132, <5> 3.4189, <6> 6.994, <7> 3.1738, <8> 4.0758, <9> 6.037, <10> 3.9306, <11> 6.1, <12> 2.912, <13> 6.9778, <14> 3.7532, <15> 6.6671, <16> 4.078, <17> 2.8807, <18> 4.8308, <19> 6.3529, <20> 6.2175;
param capacity[MACHINE] := <1> 98.1097, <2> 98.1097, <3> 98.1097, <4> 98.1097, <5> 98.1097, <6> 98.1097, <7> 98.1097;

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
