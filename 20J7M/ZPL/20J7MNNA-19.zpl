set JOB := {1 .. 20};
set MACHINE := {1 .. 7};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 26.6101, <2> 33.1297, <3> 19.1924, <4> 28.9411, <5> 32.317, <6> 23.2144, <7> 21.8192, <8> 26.6103, <9> 25.9675, <10> 24.2707, <11> 22.2158, <12> 26.2081, <13> 30.8328, <14> 22.7901, <15> 20.9215, <16> 20.841, <17> 16.979, <18> 22.7607, <19> 21.1369, <20> 24.9329;
param workload[JOB] := <1> 708.0974, <2> 1097.577, <3> 368.3482, <4> 837.5873, <5> 1044.3885, <6> 538.9084, <7> 476.0775, <8> 708.1081, <9> 674.3111, <10> 589.0669, <11> 493.5418, <12> 686.8645, <13> 950.6616, <14> 519.3887, <15> 437.7092, <16> 434.3473, <17> 288.2864, <18> 518.0495, <19> 446.7685, <20> 621.6495;
param capacity[MACHINE] := <1> 12439.7374, <2> 12439.7374, <3> 12439.7374, <4> 12439.7374, <5> 12439.7374, <6> 12439.7374, <7> 12439.7374;

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
