set JOB := {1 .. 20};
set MACHINE := {1 .. 7};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 27.2556, <2> 23.1253, <3> 26.2163, <4> 19.6946, <5> 26.7081, <6> 30.3584, <7> 21.9077, <8> 29.143, <9> 27.4029, <10> 38.4274, <11> 21.8033, <12> 18.9888, <13> 34.4872, <14> 30.195, <15> 20.3054, <16> 25.616, <17> 23.0452, <18> 20.5425, <19> 17.3763, <20> 23.5829;
param workload[JOB] := <1> 15.2214, <2> 32.626, <3> 7.6657, <4> 21.5798, <5> 49.89, <6> 22.7226, <7> 20.9128, <8> 38.3783, <9> 4.5972, <10> 20.6555, <11> 16.1742, <12> 49.4346, <13> 20.564, <14> 15.3137, <15> 47.4364, <16> 31.5064, <17> 24.1533, <18> 41.989, <19> 39.7352, <20> 12.9816;
param capacity[MACHINE] := <1> 57.1648, <2> 57.1648, <3> 57.1648, <4> 57.1648, <5> 57.1648, <6> 57.1648, <7> 57.1648;

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
