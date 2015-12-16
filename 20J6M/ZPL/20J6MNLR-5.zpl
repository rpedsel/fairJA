set JOB := {1 .. 20};
set MACHINE := {1 .. 6};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 35.092, <2> 23.6722, <3> 28.044, <4> 25.786, <5> 33.688, <6> 23.1649, <7> 21.1274, <8> 24.3279, <9> 29.821, <10> 28.7116, <11> 21.7446, <12> 30.9061, <13> 17.3912, <14> 27.9392, <15> 30.9146, <16> 15.4382, <17> 25.6909, <18> 30.427, <19> 24.8546, <20> 17.7926;
param workload[JOB] := <1> 42.3064, <2> 22.6731, <3> 11.8417, <4> 29.6446, <5> 10.2855, <6> 1.7004, <7> 1.8701, <8> 10.7923, <9> 48.9569, <10> 3.4795, <11> 8.5411, <12> 8.3171, <13> 36.7565, <14> 37.0371, <15> 44.2946, <16> 32.9949, <17> 44.0023, <18> 7.2054, <19> 39.1989, <20> 6.4241;
param capacity[MACHINE] := <1> 74.7204, <2> 74.7204, <3> 74.7204, <4> 74.7204, <5> 74.7204, <6> 74.7204;

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
