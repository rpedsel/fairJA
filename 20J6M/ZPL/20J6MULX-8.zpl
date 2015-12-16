set JOB := {1 .. 20};
set MACHINE := {1 .. 6};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 26.3445, <2> 11.4039, <3> 22.0981, <4> 40.7229, <5> 31.9057, <6> 12.011, <7> 46.0983, <8> 1.2066, <9> 0.3285, <10> 11.0858, <11> 25.9372, <12> 34.5976, <13> 0.0773, <14> 9.83, <15> 27.9179, <16> 47.6202, <17> 22.3416, <18> 39.1612, <19> 6.3284, <20> 15.6582;
param workload[JOB] := <1> 5.1327, <2> 3.377, <3> 4.7009, <4> 6.3814, <5> 5.6485, <6> 3.4657, <7> 6.7896, <8> 1.0985, <9> 0.5731, <10> 3.3295, <11> 5.0929, <12> 5.882, <13> 0.278, <14> 3.1353, <15> 5.2837, <16> 6.9007, <17> 4.7267, <18> 6.2579, <19> 2.5156, <20> 3.957;
param capacity[MACHINE] := <1> 14.0878, <2> 14.0878, <3> 14.0878, <4> 14.0878, <5> 14.0878, <6> 14.0878;

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
