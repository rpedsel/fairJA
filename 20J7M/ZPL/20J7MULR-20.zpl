set JOB := {1 .. 20};
set MACHINE := {1 .. 7};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 0.7176, <2> 41.5047, <3> 8.7801, <4> 24.246, <5> 31.574, <6> 44.0124, <7> 31.9827, <8> 35.7938, <9> 42.7177, <10> 46.5647, <11> 46.7698, <12> 32.4509, <13> 46.3356, <14> 33.3555, <15> 49.6021, <16> 41.4692, <17> 1.6996, <18> 47.1852, <19> 20.6055, <20> 33.2974;
param workload[JOB] := <1> 20.713, <2> 42.6401, <3> 28.3593, <4> 28.0182, <5> 41.1702, <6> 39.4167, <7> 7.556, <8> 41.7099, <9> 25.0977, <10> 3.6235, <11> 12.8993, <12> 9.6424, <13> 3.7405, <14> 29.993, <15> 30.1526, <16> 7.2201, <17> 17.0907, <18> 48.6155, <19> 37.1762, <20> 45.3815;
param capacity[MACHINE] := <1> 74.3166, <2> 74.3166, <3> 74.3166, <4> 74.3166, <5> 74.3166, <6> 74.3166, <7> 74.3166;

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
