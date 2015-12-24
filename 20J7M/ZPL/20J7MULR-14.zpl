set JOB := {1 .. 20};
set MACHINE := {1 .. 7};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 15.819, <2> 41.5821, <3> 12.3232, <4> 27.226, <5> 7.185, <6> 5.5085, <7> 15.0131, <8> 14.5768, <9> 20.8669, <10> 34.853, <11> 30.1228, <12> 37.2563, <13> 20.3436, <14> 36.095, <15> 3.8248, <16> 5.0064, <17> 21.9949, <18> 2.4182, <19> 34.2837, <20> 28.8329;
param workload[JOB] := <1> 1.0934, <2> 34.9769, <3> 45.7108, <4> 46.976, <5> 35.555, <6> 49.087, <7> 6.1763, <8> 37.8317, <9> 36.135, <10> 42.3943, <11> 44.4713, <12> 37.7274, <13> 47.9758, <14> 41.5313, <15> 26.841, <16> 2.1572, <17> 21.6052, <18> 18.5885, <19> 2.4822, <20> 10.8774;
param capacity[MACHINE] := <1> 84.3134, <2> 84.3134, <3> 84.3134, <4> 84.3134, <5> 84.3134, <6> 84.3134, <7> 84.3134;

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
