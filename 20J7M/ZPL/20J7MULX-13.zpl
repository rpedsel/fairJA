set JOB := {1 .. 20};
set MACHINE := {1 .. 7};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 41.078, <2> 8.931, <3> 20.0194, <4> 46.5678, <5> 43.2738, <6> 49.0281, <7> 45.8311, <8> 23.6809, <9> 32.1656, <10> 22.8315, <11> 44.155, <12> 38.4796, <13> 11.5021, <14> 48.1486, <15> 16.7869, <16> 43.2355, <17> 23.9745, <18> 47.4346, <19> 27.9259, <20> 20.5147;
param workload[JOB] := <1> 6.4092, <2> 2.9885, <3> 4.4743, <4> 6.8241, <5> 6.5783, <6> 7.002, <7> 6.7699, <8> 4.8663, <9> 5.6715, <10> 4.7782, <11> 6.6449, <12> 6.2032, <13> 3.3915, <14> 6.9389, <15> 4.0972, <16> 6.5754, <17> 4.8964, <18> 6.8873, <19> 5.2845, <20> 4.5293;
param capacity[MACHINE] := <1> 15.973, <2> 15.973, <3> 15.973, <4> 15.973, <5> 15.973, <6> 15.973, <7> 15.973;

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
