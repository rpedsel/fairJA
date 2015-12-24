set JOB := {1 .. 20};
set MACHINE := {1 .. 7};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 22.2278, <2> 47.2765, <3> 0.247, <4> 13.3446, <5> 0.8906, <6> 20.9199, <7> 4.4982, <8> 36.5271, <9> 19.7589, <10> 18.8689, <11> 3.3132, <12> 26.7514, <13> 8.1649, <14> 28.9831, <15> 38.5175, <16> 15.6219, <17> 7.5427, <18> 24.8788, <19> 40.9949, <20> 18.7785;
param workload[JOB] := <1> 7.157, <2> 19.0304, <3> 7.8762, <4> 10.2073, <5> 8.8413, <6> 26.8677, <7> 5.0794, <8> 45.2323, <9> 27.3923, <10> 2.2417, <11> 18.6341, <12> 32.1147, <13> 5.8874, <14> 22.4278, <15> 19.776, <16> 23.4671, <17> 13.2684, <18> 23.7181, <19> 30.9538, <20> 46.6289;
param capacity[MACHINE] := <1> 58.2771, <2> 58.2771, <3> 58.2771, <4> 58.2771, <5> 58.2771, <6> 58.2771, <7> 58.2771;

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
