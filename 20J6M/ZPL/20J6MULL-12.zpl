set JOB := {1 .. 20};
set MACHINE := {1 .. 6};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 48.8889, <2> 15.196, <3> 5.4714, <4> 36.74, <5> 29.9095, <6> 3.5616, <7> 3.8587, <8> 45.5507, <9> 8.8366, <10> 35.3555, <11> 2.1319, <12> 36.2537, <13> 46.8123, <14> 30.9142, <15> 41.6434, <16> 5.1887, <17> 17.8325, <18> 9.6606, <19> 23.874, <20> 49.6666;
param workload[JOB] := <1> 48.8889, <2> 15.196, <3> 5.4714, <4> 36.74, <5> 29.9095, <6> 3.5616, <7> 3.8587, <8> 45.5507, <9> 8.8366, <10> 35.3555, <11> 2.1319, <12> 36.2537, <13> 46.8123, <14> 30.9142, <15> 41.6434, <16> 5.1887, <17> 17.8325, <18> 9.6606, <19> 23.874, <20> 49.6666;
param capacity[MACHINE] := <1> 82.8911, <2> 82.8911, <3> 82.8911, <4> 82.8911, <5> 82.8911, <6> 82.8911;

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
