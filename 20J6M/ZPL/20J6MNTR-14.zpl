set JOB := {1 .. 20};
set MACHINE := {1 .. 6};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 30.6235, <2> 19.6795, <3> 20.2896, <4> 34.623, <5> 27.9441, <6> 20.9753, <7> 26.8568, <8> 24.4702, <9> 19.7411, <10> 19.7506, <11> 18.8609, <12> 23.5411, <13> 17.8172, <14> 26.696, <15> 20.2138, <16> 21.4053, <17> 27.5195, <18> 17.3095, <19> 24.2936, <20> 16.2881;
param workload[JOB] := <1> 32.1688, <2> 31.9187, <3> 15.9321, <4> 34.9109, <5> 2.0317, <6> 32.0416, <7> 16.6835, <8> 26.3366, <9> 5.1989, <10> 24.0715, <11> 6.0736, <12> 40.2895, <13> 3.9976, <14> 48.3913, <15> 6.4457, <16> 9.3383, <17> 0.153, <18> 26.1258, <19> 15.5213, <20> 30.1266;
param capacity[MACHINE] := <1> 50.9696, <2> 50.9696, <3> 50.9696, <4> 50.9696, <5> 50.9696, <6> 50.9696;

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
