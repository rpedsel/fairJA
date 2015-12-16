set JOB := {1 .. 20};
set MACHINE := {1 .. 6};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 44.4628, <2> 28.5767, <3> 26.7847, <4> 42.0197, <5> 20.482, <6> 17.9265, <7> 37.447, <8> 48.6013, <9> 10.6601, <10> 17.4039, <11> 47.6425, <12> 37.7588, <13> 36.4569, <14> 22.2796, <15> 9.6314, <16> 16.8153, <17> 21.3081, <18> 37.224, <19> 34.3083, <20> 38.5782;
param workload[JOB] := <1> 6.668, <2> 5.3457, <3> 5.1754, <4> 6.4823, <5> 4.5257, <6> 4.234, <7> 6.1194, <8> 6.9715, <9> 3.265, <10> 4.1718, <11> 6.9024, <12> 6.1448, <13> 6.038, <14> 4.7201, <15> 3.1034, <16> 4.1006, <17> 4.6161, <18> 6.1011, <19> 5.8573, <20> 6.2111;
param capacity[MACHINE] := <1> 106.7537, <2> 106.7537, <3> 106.7537, <4> 106.7537, <5> 106.7537, <6> 106.7537;

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
