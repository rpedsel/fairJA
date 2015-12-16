set JOB := {1 .. 20};
set MACHINE := {1 .. 6};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 3.1189, <2> 28.7616, <3> 36.4043, <4> 44.8196, <5> 9.0689, <6> 42.7983, <7> 4.3101, <8> 7.9629, <9> 33.0128, <10> 40.9691, <11> 42.9644, <12> 9.7625, <13> 12.9424, <14> 21.1057, <15> 23.4482, <16> 33.4928, <17> 20.3356, <18> 20.1012, <19> 42.4397, <20> 6.7725;
param workload[JOB] := <1> 3.1189, <2> 28.7616, <3> 36.4043, <4> 44.8196, <5> 9.0689, <6> 42.7983, <7> 4.3101, <8> 7.9629, <9> 33.0128, <10> 40.9691, <11> 42.9644, <12> 9.7625, <13> 12.9424, <14> 21.1057, <15> 23.4482, <16> 33.4928, <17> 20.3356, <18> 20.1012, <19> 42.4397, <20> 6.7725;
param capacity[MACHINE] := <1> 60.5739, <2> 60.5739, <3> 60.5739, <4> 60.5739, <5> 60.5739, <6> 60.5739;

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
