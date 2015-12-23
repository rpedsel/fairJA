set JOB := {1 .. 20};
set MACHINE := {1 .. 7};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 1.6988, <2> 48.6005, <3> 9.3721, <4> 26.9058, <5> 3.7959, <6> 49.4916, <7> 9.9819, <8> 15.9885, <9> 3.526, <10> 1.1134, <11> 40.7408, <12> 48.4063, <13> 34.0159, <14> 44.203, <15> 49.8777, <16> 1.0079, <17> 26.0695, <18> 36.0471, <19> 39.9628, <20> 38.035;
param workload[JOB] := <1> 1.3034, <2> 6.9714, <3> 3.0614, <4> 5.1871, <5> 1.9483, <6> 7.035, <7> 3.1594, <8> 3.9986, <9> 1.8778, <10> 1.0552, <11> 6.3829, <12> 6.9575, <13> 5.8323, <14> 6.6485, <15> 7.0624, <16> 1.0039, <17> 5.1058, <18> 6.0039, <19> 6.3216, <20> 6.1673;
param capacity[MACHINE] := <1> 13.2977, <2> 13.2977, <3> 13.2977, <4> 13.2977, <5> 13.2977, <6> 13.2977, <7> 13.2977;

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
