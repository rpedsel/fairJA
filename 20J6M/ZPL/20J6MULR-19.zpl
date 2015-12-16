set JOB := {1 .. 20};
set MACHINE := {1 .. 6};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 31.5219, <2> 28.0761, <3> 48.9531, <4> 19.0709, <5> 34.5092, <6> 49.519, <7> 45.3127, <8> 34.4436, <9> 7.1022, <10> 32.9835, <11> 8.6208, <12> 47.3591, <13> 11.3601, <14> 40.5104, <15> 40.8216, <16> 37.9018, <17> 34.9134, <18> 46.7485, <19> 27.1729, <20> 13.2418;
param workload[JOB] := <1> 18.5186, <2> 48.3278, <3> 25.442, <4> 40.4023, <5> 2.0147, <6> 0.746, <7> 28.095, <8> 12.8761, <9> 36.9663, <10> 1.5213, <11> 6.5395, <12> 27.3621, <13> 2.994, <14> 35.4881, <15> 44.0639, <16> 15.1451, <17> 29.5329, <18> 44.1109, <19> 4.169, <20> 1.6166;
param capacity[MACHINE] := <1> 70.9887, <2> 70.9887, <3> 70.9887, <4> 70.9887, <5> 70.9887, <6> 70.9887;

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
