set JOB := {1 .. 20};
set MACHINE := {1 .. 7};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 32.3815, <2> 6.2014, <3> 44.3795, <4> 8.4157, <5> 2.5624, <6> 49.1444, <7> 27.6526, <8> 35.4, <9> 39.973, <10> 12.3298, <11> 49.0078, <12> 17.903, <13> 24.8533, <14> 45.996, <15> 46.421, <16> 34.2787, <17> 46.0264, <18> 44.2729, <19> 49.8019, <20> 32.7571;
param workload[JOB] := <1> 5.6905, <2> 2.4903, <3> 6.6618, <4> 2.901, <5> 1.6007, <6> 7.0103, <7> 5.2586, <8> 5.9498, <9> 6.3224, <10> 3.5114, <11> 7.0006, <12> 4.2312, <13> 4.9853, <14> 6.782, <15> 6.8133, <16> 5.8548, <17> 6.7843, <18> 6.6538, <19> 7.057, <20> 5.7234;
param capacity[MACHINE] := <1> 11.7088, <2> 11.7088, <3> 11.7088, <4> 11.7088, <5> 11.7088, <6> 11.7088, <7> 11.7088;

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
