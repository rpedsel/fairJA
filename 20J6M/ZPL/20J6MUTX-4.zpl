set JOB := {1 .. 20};
set MACHINE := {1 .. 6};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 19.3096, <2> 43.2753, <3> 24.4263, <4> 36.9977, <5> 45.4159, <6> 46.4306, <7> 11.6448, <8> 11.3823, <9> 32.6862, <10> 40.9604, <11> 12.6452, <12> 44.4549, <13> 38.5361, <14> 25.9779, <15> 12.8465, <16> 26.8871, <17> 1.6482, <18> 8.6493, <19> 46.4099, <20> 38.5209;
param workload[JOB] := <1> 4.3943, <2> 6.5784, <3> 4.9423, <4> 6.0826, <5> 6.7391, <6> 6.814, <7> 3.4124, <8> 3.3738, <9> 5.7172, <10> 6.4, <11> 3.556, <12> 6.6675, <13> 6.2077, <14> 5.0969, <15> 3.5842, <16> 5.1853, <17> 1.2838, <18> 2.941, <19> 6.8125, <20> 6.2065;
param capacity[MACHINE] := <1> 12.7494, <2> 12.7494, <3> 12.7494, <4> 12.7494, <5> 12.7494, <6> 12.7494;

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
