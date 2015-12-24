set JOB := {1 .. 20};
set MACHINE := {1 .. 7};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 2.3211, <2> 5.5938, <3> 2.5081, <4> 46.7716, <5> 15.1022, <6> 24.7063, <7> 47.9298, <8> 34.6924, <9> 15.3874, <10> 34.9922, <11> 39.231, <12> 43.5657, <13> 33.79, <14> 14.9637, <15> 18.5299, <16> 35.3269, <17> 30.3457, <18> 12.0907, <19> 41.646, <20> 0.8323;
param workload[JOB] := <1> 1.5235, <2> 2.3651, <3> 1.5837, <4> 6.839, <5> 3.8862, <6> 4.9705, <7> 6.9231, <8> 5.89, <9> 3.9227, <10> 5.9154, <11> 6.2635, <12> 6.6004, <13> 5.8129, <14> 3.8683, <15> 4.3046, <16> 5.9436, <17> 5.5087, <18> 3.4772, <19> 6.4534, <20> 0.9123;
param capacity[MACHINE] := <1> 9.9604, <2> 9.9604, <3> 9.9604, <4> 9.9604, <5> 9.9604, <6> 9.9604, <7> 9.9604;

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
