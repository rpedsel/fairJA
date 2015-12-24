set JOB := {1 .. 20};
set MACHINE := {1 .. 7};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 27.1845, <2> 20.6554, <3> 23.2099, <4> 26.616, <5> 27.0957, <6> 31.3671, <7> 24.1506, <8> 27.1966, <9> 21.7983, <10> 26.8217, <11> 27.0877, <12> 24.3299, <13> 28.3918, <14> 17.3557, <15> 20.6151, <16> 20.9299, <17> 21.438, <18> 29.8671, <19> 19.5779, <20> 21.1523;
param workload[JOB] := <1> 738.997, <2> 426.6455, <3> 538.6995, <4> 708.4115, <5> 734.177, <6> 983.895, <7> 583.2515, <8> 739.6551, <9> 475.1659, <10> 719.4036, <11> 733.7435, <12> 591.944, <13> 806.0943, <14> 301.2203, <15> 424.9823, <16> 438.0607, <17> 459.5878, <18> 892.0437, <19> 383.2942, <20> 447.4198;
param capacity[MACHINE] := <1> 12126.6922, <2> 12126.6922, <3> 12126.6922, <4> 12126.6922, <5> 12126.6922, <6> 12126.6922, <7> 12126.6922;

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
