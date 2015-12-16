set JOB := {1 .. 20};
set MACHINE := {1 .. 6};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 30.9965, <2> 16.1401, <3> 12.5936, <4> 18.4155, <5> 32.3333, <6> 8.5427, <7> 16.5492, <8> 8.7157, <9> 26.9824, <10> 34.3218, <11> 48.2403, <12> 0.6332, <13> 9.3782, <14> 28.0861, <15> 6.0946, <16> 18.2369, <17> 35.7649, <18> 25.3395, <19> 39.4267, <20> 1.8157;
param workload[JOB] := <1> 5.5675, <2> 4.0175, <3> 3.5487, <4> 4.2913, <5> 5.6862, <6> 2.9228, <7> 4.0681, <8> 2.9522, <9> 5.1945, <10> 5.8585, <11> 6.9455, <12> 0.7957, <13> 3.0624, <14> 5.2996, <15> 2.4687, <16> 4.2705, <17> 5.9804, <18> 5.0338, <19> 6.2791, <20> 1.3475;
param capacity[MACHINE] := <1> 14.2651, <2> 14.2651, <3> 14.2651, <4> 14.2651, <5> 14.2651, <6> 14.2651;

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
