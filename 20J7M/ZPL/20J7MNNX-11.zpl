set JOB := {1 .. 20};
set MACHINE := {1 .. 7};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 30.057, <2> 24.4202, <3> 28.3941, <4> 23.6499, <5> 16.4255, <6> 26.497, <7> 26.5107, <8> 24.8011, <9> 32.5088, <10> 23.3208, <11> 29.6634, <12> 22.8689, <13> 29.1135, <14> 24.3182, <15> 27.8135, <16> 14.9649, <17> 16.6094, <18> 27.0463, <19> 31.6284, <20> 21.7689;
param workload[JOB] := <1> 5.4824, <2> 4.9417, <3> 5.3286, <4> 4.8631, <5> 4.0528, <6> 5.1475, <7> 5.1489, <8> 4.9801, <9> 5.7016, <10> 4.8292, <11> 5.4464, <12> 4.7821, <13> 5.3957, <14> 4.9313, <15> 5.2739, <16> 3.8684, <17> 4.0755, <18> 5.2006, <19> 5.6239, <20> 4.6657;
param capacity[MACHINE] := <1> 99.7394, <2> 99.7394, <3> 99.7394, <4> 99.7394, <5> 99.7394, <6> 99.7394, <7> 99.7394;

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
