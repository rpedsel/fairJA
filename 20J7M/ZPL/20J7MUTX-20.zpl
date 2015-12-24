set JOB := {1 .. 20};
set MACHINE := {1 .. 7};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 7.8934, <2> 33.7575, <3> 19.2316, <4> 49.4424, <5> 44.6976, <6> 36.7877, <7> 42.6491, <8> 6.2123, <9> 21.5399, <10> 16.8136, <11> 24.9773, <12> 17.4389, <13> 32.5388, <14> 4.0663, <15> 28.739, <16> 10.7098, <17> 34.8941, <18> 4.015, <19> 34.0745, <20> 20.6283;
param workload[JOB] := <1> 2.8095, <2> 5.8101, <3> 4.3854, <4> 7.0315, <5> 6.6856, <6> 6.0653, <7> 6.5306, <8> 2.4924, <9> 4.6411, <10> 4.1004, <11> 4.9977, <12> 4.176, <13> 5.7043, <14> 2.0165, <15> 5.3609, <16> 3.2726, <17> 5.9071, <18> 2.0037, <19> 5.8373, <20> 4.5418;
param capacity[MACHINE] := <1> 10.1111, <2> 10.1111, <3> 10.1111, <4> 10.1111, <5> 10.1111, <6> 10.1111, <7> 10.1111;

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
