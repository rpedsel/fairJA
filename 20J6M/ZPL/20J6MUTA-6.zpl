set JOB := {1 .. 20};
set MACHINE := {1 .. 6};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 1.9671, <2> 45.4589, <3> 15.5722, <4> 48.1482, <5> 26.6753, <6> 38.2808, <7> 39.3635, <8> 8.237, <9> 18.5925, <10> 18.5394, <11> 35.048, <12> 8.7205, <13> 14.8435, <14> 7.1405, <15> 24.0018, <16> 37.3548, <17> 18.4505, <18> 29.7571, <19> 3.2373, <20> 28.2504;
param workload[JOB] := <1> 3.8695, <2> 2066.5116, <3> 242.4934, <4> 2318.2492, <5> 711.5716, <6> 1465.4196, <7> 1549.4851, <8> 67.8482, <9> 345.6811, <10> 343.7094, <11> 1228.3623, <12> 76.0471, <13> 220.3295, <14> 50.9867, <15> 576.0864, <16> 1395.3811, <17> 340.421, <18> 885.485, <19> 10.4801, <20> 798.0851;
param capacity[MACHINE] := <1> 1837.0629, <2> 1837.0629, <3> 1837.0629, <4> 1837.0629, <5> 1837.0629, <6> 1837.0629;

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
