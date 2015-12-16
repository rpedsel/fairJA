set JOB := {1 .. 20};
set MACHINE := {1 .. 6};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 25.2976, <2> 19.4125, <3> 24.0231, <4> 26.9334, <5> 24.7163, <6> 28.1184, <7> 22.8918, <8> 21.9759, <9> 27.9297, <10> 32.842, <11> 26.0876, <12> 31.3871, <13> 24.4489, <14> 27.2346, <15> 22.1584, <16> 23.31, <17> 24.0405, <18> 29.1228, <19> 17.9947, <20> 27.6351;
param workload[JOB] := <1> 5.0297, <2> 4.406, <3> 4.9013, <4> 5.1897, <5> 4.9715, <6> 5.3027, <7> 4.7845, <8> 4.6878, <9> 5.2849, <10> 5.7308, <11> 5.1076, <12> 5.6024, <13> 4.9446, <14> 5.2187, <15> 4.7073, <16> 4.828, <17> 4.9031, <18> 5.3966, <19> 4.242, <20> 5.2569;
param capacity[MACHINE] := <1> 12.5621, <2> 12.5621, <3> 12.5621, <4> 12.5621, <5> 12.5621, <6> 12.5621;

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
