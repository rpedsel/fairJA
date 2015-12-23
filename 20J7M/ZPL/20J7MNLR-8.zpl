set JOB := {1 .. 20};
set MACHINE := {1 .. 7};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 14.5447, <2> 22.1256, <3> 21.0556, <4> 26.3319, <5> 17.4936, <6> 22.9718, <7> 19.6836, <8> 24.8889, <9> 30.2206, <10> 23.2391, <11> 23.1192, <12> 14.5731, <13> 24.7321, <14> 38.6568, <15> 21.6594, <16> 37.144, <17> 26.7664, <18> 18.9533, <19> 22.9812, <20> 24.5802;
param workload[JOB] := <1> 1.9298, <2> 25.3495, <3> 40.5474, <4> 32.8044, <5> 9.9556, <6> 37.6597, <7> 16.4103, <8> 3.418, <9> 49.5021, <10> 41.966, <11> 39.8077, <12> 44.0404, <13> 23.1784, <14> 27.7964, <15> 6.5596, <16> 18.5132, <17> 27.544, <18> 10.1148, <19> 15.206, <20> 46.4597;
param capacity[MACHINE] := <1> 74.109, <2> 74.109, <3> 74.109, <4> 74.109, <5> 74.109, <6> 74.109, <7> 74.109;

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
