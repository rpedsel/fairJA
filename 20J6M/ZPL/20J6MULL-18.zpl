set JOB := {1 .. 20};
set MACHINE := {1 .. 6};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 37.8942, <2> 26.6831, <3> 13.003, <4> 45.7562, <5> 41.3926, <6> 30.377, <7> 31.5439, <8> 31.4674, <9> 46.8547, <10> 49.018, <11> 43.3269, <12> 11.6579, <13> 38.022, <14> 48.261, <15> 20.2653, <16> 18.3871, <17> 11.9321, <18> 27.6014, <19> 4.4945, <20> 28.6787;
param workload[JOB] := <1> 37.8942, <2> 26.6831, <3> 13.003, <4> 45.7562, <5> 41.3926, <6> 30.377, <7> 31.5439, <8> 31.4674, <9> 46.8547, <10> 49.018, <11> 43.3269, <12> 11.6579, <13> 38.022, <14> 48.261, <15> 20.2653, <16> 18.3871, <17> 11.9321, <18> 27.6014, <19> 4.4945, <20> 28.6787;
param capacity[MACHINE] := <1> 101.1028, <2> 101.1028, <3> 101.1028, <4> 101.1028, <5> 101.1028, <6> 101.1028;

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
