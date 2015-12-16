set JOB := {1 .. 20};
set MACHINE := {1 .. 6};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 25.4878, <2> 39.5073, <3> 29.1248, <4> 38.3825, <5> 45.5562, <6> 42.8284, <7> 35.8018, <8> 29.3671, <9> 40.2366, <10> 8.3268, <11> 5.6977, <12> 35.5688, <13> 43.0556, <14> 42.4528, <15> 6.9757, <16> 19.6834, <17> 29.3197, <18> 5.5634, <19> 47.8181, <20> 20.2475;
param workload[JOB] := <1> 42.7895, <2> 33.8335, <3> 32.1942, <4> 17.797, <5> 14.1968, <6> 1.7707, <7> 28.2858, <8> 46.304, <9> 26.9352, <10> 34.4696, <11> 47.7872, <12> 3.4629, <13> 11.6338, <14> 34.7324, <15> 46.5101, <16> 9.3912, <17> 8.7632, <18> 31.306, <19> 46.1591, <20> 42.9438;
param capacity[MACHINE] := <1> 561.266, <2> 561.266, <3> 561.266, <4> 561.266, <5> 561.266, <6> 561.266;

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
