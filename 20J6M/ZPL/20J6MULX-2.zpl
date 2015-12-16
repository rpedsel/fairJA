set JOB := {1 .. 20};
set MACHINE := {1 .. 6};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 37.1228, <2> 25.1156, <3> 21.6964, <4> 34.0725, <5> 13.5722, <6> 4.7592, <7> 37.5696, <8> 33.6161, <9> 44.4258, <10> 43.1269, <11> 44.7749, <12> 48.0618, <13> 41.1477, <14> 37.6757, <15> 12.0633, <16> 31.1553, <17> 36.0989, <18> 20.1005, <19> 40.4972, <20> 23.1541;
param workload[JOB] := <1> 6.0928, <2> 5.0115, <3> 4.6579, <4> 5.8372, <5> 3.684, <6> 2.1816, <7> 6.1294, <8> 5.7979, <9> 6.6653, <10> 6.5671, <11> 6.6914, <12> 6.9327, <13> 6.4146, <14> 6.1381, <15> 3.4732, <16> 5.5817, <17> 6.0082, <18> 4.4834, <19> 6.3637, <20> 4.8119;
param capacity[MACHINE] := <1> 18.2539, <2> 18.2539, <3> 18.2539, <4> 18.2539, <5> 18.2539, <6> 18.2539;

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
