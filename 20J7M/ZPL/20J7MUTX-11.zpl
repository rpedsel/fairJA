set JOB := {1 .. 20};
set MACHINE := {1 .. 7};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 33.6064, <2> 39.0941, <3> 49.0638, <4> 37.2742, <5> 36.2959, <6> 44.5564, <7> 49.1251, <8> 5.5041, <9> 46.6995, <10> 46.9249, <11> 15.0928, <12> 32.641, <13> 48.2843, <14> 45.7031, <15> 8.2907, <16> 18.6688, <17> 3.3894, <18> 3.6436, <19> 14.3352, <20> 19.5143;
param workload[JOB] := <1> 5.7971, <2> 6.2525, <3> 7.0046, <4> 6.1053, <5> 6.0246, <6> 6.6751, <7> 7.0089, <8> 2.3461, <9> 6.8337, <10> 6.8502, <11> 3.8849, <12> 5.7132, <13> 6.9487, <14> 6.7604, <15> 2.8794, <16> 4.3207, <17> 1.841, <18> 1.9088, <19> 3.7862, <20> 4.4175;
param capacity[MACHINE] := <1> 11.0742, <2> 11.0742, <3> 11.0742, <4> 11.0742, <5> 11.0742, <6> 11.0742, <7> 11.0742;

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
