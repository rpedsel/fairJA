set JOB := {1 .. 20};
set MACHINE := {1 .. 6};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 24.8697, <2> 3.2848, <3> 16.8356, <4> 0.5984, <5> 42.0667, <6> 22.5281, <7> 26.1214, <8> 1.8764, <9> 4.814, <10> 31.8694, <11> 1.8944, <12> 27.8306, <13> 20.3608, <14> 18.6924, <15> 33.1043, <16> 27.7017, <17> 23.4943, <18> 10.13, <19> 10.2065, <20> 33.4206;
param workload[JOB] := <1> 27.818, <2> 20.8858, <3> 18.2467, <4> 44.153, <5> 42.2539, <6> 5.0363, <7> 2.2772, <8> 2.6775, <9> 9.1984, <10> 14.5342, <11> 2.5812, <12> 3.5788, <13> 15.6879, <14> 1.5232, <15> 38.6126, <16> 22.7605, <17> 26.7479, <18> 13.5737, <19> 12.3231, <20> 23.7944;
param capacity[MACHINE] := <1> 43.533, <2> 43.533, <3> 43.533, <4> 43.533, <5> 43.533, <6> 43.533;

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
