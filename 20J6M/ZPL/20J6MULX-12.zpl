set JOB := {1 .. 20};
set MACHINE := {1 .. 6};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 9.797, <2> 48.8962, <3> 32.6807, <4> 9.8259, <5> 48.908, <6> 34.3848, <7> 0.7977, <8> 24.5352, <9> 33.5092, <10> 27.6636, <11> 38.1984, <12> 14.8036, <13> 32.8514, <14> 35.0024, <15> 30.4933, <16> 25.0225, <17> 7.6805, <18> 0.6408, <19> 37.0162, <20> 43.0602;
param workload[JOB] := <1> 3.13, <2> 6.9926, <3> 5.7167, <4> 3.1346, <5> 6.9934, <6> 5.8639, <7> 0.8931, <8> 4.9533, <9> 5.7887, <10> 5.2596, <11> 6.1805, <12> 3.8475, <13> 5.7316, <14> 5.9163, <15> 5.5221, <16> 5.0022, <17> 2.7714, <18> 0.8005, <19> 6.0841, <20> 6.562;
param capacity[MACHINE] := <1> 16.1907, <2> 16.1907, <3> 16.1907, <4> 16.1907, <5> 16.1907, <6> 16.1907;

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
