set JOB := {1 .. 20};
set MACHINE := {1 .. 6};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 36.3888, <2> 29.9314, <3> 39.2499, <4> 12.5482, <5> 38.9745, <6> 34.035, <7> 31.8946, <8> 43.0905, <9> 34.3227, <10> 10.3466, <11> 0.4711, <12> 16.4816, <13> 4.2022, <14> 30.5724, <15> 36.7957, <16> 37.8587, <17> 43.4083, <18> 23.4819, <19> 31.2773, <20> 26.1223;
param workload[JOB] := <1> 11.6538, <2> 13.4483, <3> 27.3745, <4> 23.6939, <5> 47.7615, <6> 9.8261, <7> 27.0294, <8> 0.7602, <9> 38.7851, <10> 32.5267, <11> 5.9954, <12> 25.5871, <13> 2.0528, <14> 47.3202, <15> 37.0281, <16> 7.0591, <17> 36.5754, <18> 44.1452, <19> 23.7743, <20> 0.1573;
param capacity[MACHINE] := <1> 77.0924, <2> 77.0924, <3> 77.0924, <4> 77.0924, <5> 77.0924, <6> 77.0924;

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
