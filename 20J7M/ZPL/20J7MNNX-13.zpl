set JOB := {1 .. 20};
set MACHINE := {1 .. 7};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 21.994, <2> 19.0005, <3> 20.6088, <4> 24.6321, <5> 18.5796, <6> 16.1424, <7> 21.9978, <8> 27.2657, <9> 17.6064, <10> 26.4909, <11> 29.9581, <12> 30.505, <13> 28.094, <14> 24.7988, <15> 24.4431, <16> 17.6985, <17> 23.4903, <18> 25.4536, <19> 24.4161, <20> 19.443;
param workload[JOB] := <1> 4.6898, <2> 4.359, <3> 4.5397, <4> 4.9631, <5> 4.3104, <6> 4.0178, <7> 4.6902, <8> 5.2217, <9> 4.196, <10> 5.1469, <11> 5.4734, <12> 5.5231, <13> 5.3004, <14> 4.9798, <15> 4.944, <16> 4.207, <17> 4.8467, <18> 5.0452, <19> 4.9413, <20> 4.4094;
param capacity[MACHINE] := <1> 95.8049, <2> 95.8049, <3> 95.8049, <4> 95.8049, <5> 95.8049, <6> 95.8049, <7> 95.8049;

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
