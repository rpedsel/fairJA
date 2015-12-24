set JOB := {1 .. 20};
set MACHINE := {1 .. 7};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 27.4018, <2> 30.511, <3> 15.3176, <4> 20.4268, <5> 23.2561, <6> 22.289, <7> 28.8679, <8> 16.0592, <9> 30.8029, <10> 32.1075, <11> 22.859, <12> 28.0128, <13> 16.6079, <14> 26.1697, <15> 27.6815, <16> 29.0594, <17> 31.7337, <18> 32.2319, <19> 25.8008, <20> 15.9904;
param workload[JOB] := <1> 15.346, <2> 34.1118, <3> 43.4403, <4> 47.363, <5> 38.3117, <6> 27.7306, <7> 46.0447, <8> 43.6347, <9> 48.9928, <10> 42.1221, <11> 29.1647, <12> 19.4921, <13> 2.6643, <14> 2.8528, <15> 4.109, <16> 33.6232, <17> 2.3667, <18> 28.2559, <19> 11.8948, <20> 41.5344;
param capacity[MACHINE] := <1> 80.4365, <2> 80.4365, <3> 80.4365, <4> 80.4365, <5> 80.4365, <6> 80.4365, <7> 80.4365;

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
